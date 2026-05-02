import re

# A basic predefined list of skills. In a real system, this could be loaded from a database or a large taxonomy.
PREDEFINED_SKILLS = [
    "python", "java", "c++", "c#", "javascript", "typescript", "html", "css",
    "react", "angular", "vue", "node.js", "express", "fastapi", "django", "flask",
    "spring boot", "flutter", "dart", "swift", "kotlin", "react native",
    "sql", "mysql", "postgresql", "mongodb", "redis", "elasticsearch",
    "aws", "azure", "gcp", "docker", "kubernetes", "jenkins", "github actions",
    "git", "linux", "bash", "agile", "scrum", "ui/ux", "machine learning",
    "data science", "pandas", "numpy", "scikit-learn", "tensorflow", "pytorch",
    "nlp", "computer vision", "statistics", "data analysis", "api", "rest", "graphql",
    "mobile development", "web development", "backend", "frontend", "full stack"
]

def extract_skills(text: str) -> list[str]:
    """
    Extract skills from text based on a predefined list of skills.
    Uses simple regex for keyword matching.
    """
    text_lower = text.lower()
    extracted = []
    
    for skill in PREDEFINED_SKILLS:
        # Create a regex to match the skill as a whole word to avoid partial matches
        # Handle special characters in skills like c++, c#
        escaped_skill = re.escape(skill)
        pattern = r'\b' + escaped_skill + r'\b'
        
        if re.search(pattern, text_lower):
            extracted.append(skill)
            
    return extracted

def analyze_skill_gap(extracted_skills: list[str], required_skills: list[str]) -> tuple[int, list[str]]:
    """
    Compare extracted skills against required skills to find a match score and missing skills.
    """
    extracted_set = set([s.lower() for s in extracted_skills])
    required_set = set([s.lower() for s in required_skills])
    
    if not required_set:
        return 100, []
        
    matched = required_set.intersection(extracted_set)
    missing = required_set.difference(extracted_set)
    
    score = int((len(matched) / len(required_set)) * 100)
    
    return score, list(missing)
