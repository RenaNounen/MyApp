FROM python:3.6-slim
WORKDIR /home
COPY . .

# pip install
RUN pip install setuptools
