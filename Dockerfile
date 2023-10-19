#stage1
FROM python:3.9 AS big-stage

WORKDIR /app

COPY . .

#stage2

FROM python:3.9-slim-bullseye

COPY --from=big-stage /app /app

RUN pip install flask

CMD ["python","app.py"]



