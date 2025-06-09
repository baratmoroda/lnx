FROM python:3.10-alpine AS builder
WORKDIR /build
COPY ./pyproject.toml ./pyproject.toml
RUN pip install --prefix=/install .
RUN pip install --prefix=/install ".[test]"
 
FROM python:3.10-alpine AS runtime
WORKDIR /app
COPY . .
COPY --from=builder /install /usr/local

RUN find /usr/local -type d -name '__pycache__' -exec rm -rf {} + && \
    find /usr/local -type f -name '*.pyc' -delete && \
    find /usr/local -type f -name '*.pyo' -delete && \
    find /app -type d -name '__pycache__' -exec rm -rf {} + && \
    find /app -type f -name '*.pyc' -delete && \
    find /app -type f -name '*.pyo' -delete
 
EXPOSE 8095
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8095"]
