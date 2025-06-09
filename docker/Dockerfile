FROM python:3.10-alpine AS builder
WORKDIR /build

RUN apk add --no-cache build-base

COPY pyproject.toml .


RUN pip install --no-cache-dir --prefix=/install .

RUN pip install --no-cache-dir --prefix=/install ".[test]"

RUN find /install -type d -name '__pycache__' -exec rm -rf {} + && \
    find /install -type f -name '*.pyc' -delete && \
    find /install -type f -name '*.pyo' -delete

COPY . .


FROM python:3.10-alpine AS runtime
WORKDIR /app

COPY --from=builder /install /usr/local

COPY . .


RUN find /usr/local -type d -name '__pycache__' -exec rm -rf {} + && \
    find /usr/local -type f -name '*.pyc' -delete && \
    find /usr/local -type f -name '*.pyo' -delete && \
    find /app -type d -name '__pycache__' -exec rm -rf {} + && \
    find /app -type f -name '*.pyc' -delete && \
    find /app -type f -name '*.pyo' -delete

EXPOSE 8095
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8095"]
