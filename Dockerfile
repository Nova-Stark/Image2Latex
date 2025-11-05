FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt ./ 

RUN pip install -r requirements.txt

RUN python -c "from pix2tex.cli import LatexOCR; LatexOCR()"
COPY . .

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
