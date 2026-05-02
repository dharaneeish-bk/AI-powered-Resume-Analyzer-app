from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

from core.pdf_parser import extract_text_from_pdf
from core.nlp_engine import extract_skills
from core.job_matcher import load_jobs, match_jobs, get_overall_score

app = FastAPI(title="Smart Resume Analyzer API")

# Add CORS middleware to allow Flutter app to connect
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class JobMatch(BaseModel):
    title: str
    match_percentage: int

class AnalyzeResponse(BaseModel):
    score: int
    skills: list[str]
    missing_skills: list[str]
    job_matches: list[JobMatch]
    suggestions: str

@app.get("/")
def read_root():
    return {"message": "Welcome to Smart Resume Analyzer API"}

@app.post("/analyze", response_model=AnalyzeResponse)
async def analyze_resume(file: UploadFile = File(...)):
    if not file.filename.lower().endswith('.pdf'):
        raise HTTPException(status_code=400, detail="Only PDF files are supported.")
        
    try:
        # Read the file
        contents = await file.read()
        
        # 1. Extract text from PDF
        text = extract_text_from_pdf(contents)
        if not text.strip():
            raise HTTPException(status_code=400, detail="Could not extract text from PDF or PDF is empty.")
            
        # 2. Extract Skills
        skills = extract_skills(text)
        
        # 3. Load Jobs and match
        jobs_db = load_jobs()
        all_job_matches = match_jobs(skills, jobs_db)
        
        # 4. Calculate overall score and missing skills based on the best job match
        score, missing_skills = get_overall_score(skills, jobs_db)
        
        # 5. Format job matches for response
        formatted_matches = [
            JobMatch(title=jm["title"], match_percentage=jm["match_percentage"])
            for jm in all_job_matches
        ]
        
        # Generate placeholder AI suggestion
        suggestions = "Consider adding more cloud-related skills to improve your backend developer profile. Highlighting specific projects using AWS or Docker will significantly boost your score."
        
        return AnalyzeResponse(
            score=score,
            skills=skills,
            missing_skills=missing_skills,
            job_matches=formatted_matches,
            suggestions=suggestions
        )
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
