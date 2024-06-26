FROM python:3.9

WORKDIR /

COPY requirements.txt /app/backend
RUN pip install -r requirements.txt

COPY . /

EXPOSE 8000

CMD python /manage.py runserver 0.0.0.0:8000
