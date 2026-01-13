# 1️⃣ Base image
FROM python:3.10-slim

# 2️⃣ Set working directory
WORKDIR /app

# 3️⃣ Environment variables (recommended)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 4️⃣ Copy requirements
COPY requirements.txt .

# 5️⃣ Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 6️⃣ Copy project code
COPY . .

# 7️⃣ Expose port
EXPOSE 8000

# 8️⃣ Run app with Gunicorn (PRODUCTION)
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
