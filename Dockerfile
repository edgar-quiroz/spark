FROM python:3.5-buster

RUN echo "deb http://deb.debian.org/debian/ sid main" >> /etc/apt/sources.list
RUN apt update -y && apt upgrade -y
RUN apt install -y openjdk-8-jdk

RUN pip install sklearn && pip install matplotlib && pip install seaborn && pip install pyspark && pip install pytrends

COPY ./spark-3.0.0-preview2-bin-hadoop2.7 /etc/spark

WORKDIR /work/ 