import json
import os
from .nlp_engine import analyze_skill_gap

def load_jobs(filepath: str = "data/jobs.json") -> list[dict]:
    """
    Load job dataset from a JSON file.
    """
    try:
        base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        full_path = os.path.join(base_dir, filepath)
        with open(full_path, 'r') as f:
            return json.load(f)
    except Exception as e:
        print(f"Error loading jobs: {e}")
        return []

def match_jobs(extracted_skills: list[str], jobs: list[dict]) -> list[dict]:
    """
    Match extracted skills against a list of jobs.
    Returns a sorted list of jobs with match percentages.
    """
    results = []
    
    for job in jobs:
        required_skills = job.get("required_skills", [])
        score, missing = analyze_skill_gap(extracted_skills, required_skills)
        
        results.append({
            "title": job.get("title"),
            "match_percentage": score,
            "required_skills": required_skills,
            "missing_skills": missing
        })
        
    # Sort by highest match score
    results.sort(key=lambda x: x["match_percentage"], reverse=True)
    return results

def get_overall_score(extracted_skills: list[str], jobs: list[dict]) -> tuple[int, list[str]]:
    """
    Calculate an overall resume score based on the highest matching job.
    Returns the score and the missing skills for that top job.
    """
    if not jobs:
        return 0, []
        
    matched_jobs = match_jobs(extracted_skills, jobs)
    if matched_jobs:
        best_match = matched_jobs[0]
        return best_match["match_percentage"], best_match["missing_skills"]
    
    return 0, []
