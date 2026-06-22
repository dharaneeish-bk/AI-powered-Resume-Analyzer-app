import nltk
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords

# Download once
nltk.download("punkt")
nltk.download("stopwords")

PREDEFINED_SKILLS = [
    "python", "java", "c++", "c#", "javascript", "typescript",
    "html", "css", "react", "angular", "vue", "node.js",
    "express", "fastapi", "django", "flask", "spring boot",
    "flutter", "dart", "swift", "kotlin", "react native",
    "sql", "mysql", "postgresql", "mongodb", "redis",
    "aws", "azure", "docker", "kubernetes", "git",
    "linux", "machine learning", "data science",
    "tensorflow", "pytorch", "nlp", "computer vision",
    "data analysis", "api", "rest", "graphql",
    "mobile development", "web development",
    "backend", "frontend", "full stack"
]


def preprocess_text(text: str):

    text = text.lower()

    tokens = word_tokenize(text)

    stop_words = set(stopwords.words("english"))

    cleaned_tokens = []

    for token in tokens:
        if token.isalnum() and token not in stop_words:
            cleaned_tokens.append(token)

    return cleaned_tokens


def extract_skills(text: str):

    tokens = preprocess_text(text)

    cleaned_text = " ".join(tokens)

    extracted = []

    for skill in PREDEFINED_SKILLS:

        if " " in skill:
            if skill.lower() in cleaned_text:
                extracted.append(skill)

        else:
            if skill.lower() in tokens:
                extracted.append(skill)

    return list(set(extracted))


def analyze_skill_gap(
    extracted_skills: list[str],
    required_skills: list[str]
):

    extracted = set(
        skill.lower()
        for skill in extracted_skills
    )

    required = set(
        skill.lower()
        for skill in required_skills
    )

    if len(required) == 0:
        return 100, []

    matched = extracted.intersection(required)

    missing = required.difference(extracted)

    score = int(
        (len(matched) / len(required))
        * 100
    )

    return score, list(missing)
