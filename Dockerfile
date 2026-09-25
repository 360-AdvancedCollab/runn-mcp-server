FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    FASTMCP_HOST=0.0.0.0

COPY requirements.txt ./
RUN python -m pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*.

COPY mcp_runn_server.py runn_reports.py ./

EXPOSE 8000

CMD ["python", "mcp_runn_server.py", "--transport", "streamable-http"]
