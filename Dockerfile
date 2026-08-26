# --- Stage 1: Builder ---
FROM python:3.11-alpine AS builder

WORKDIR /app

RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip setuptools \
    && pip install --no-cache-dir --prefix=/install -r requirements.txt


FROM python:3.11-alpine AS runner

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /home/myapp

COPY --from=builder /install/ /usr/local/
COPY --chown=appuser:appgroup . .

USER appuser

EXPOSE 5050

CMD ["gunicorn", "--bind", "0.0.0.0:5050", "--workers", "4", "sample_app:app"]