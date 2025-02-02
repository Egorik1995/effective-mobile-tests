FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN playwright install
RUN playwright install-deps

CMD ["pytest", "--alluredir=allure-results"]