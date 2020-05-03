# Spark docker image  
  
## To build this image we hace two options:  
1) Download manually Apache Spark and COPY to Docker.  
2) Use ADD command to download spark files every docker build.  
  
[spark-3.0.0-preview2-bin-hadoop2.7.tgz](https://downloads.apache.org/spark/spark-3.0.0-preview2/spark-3.0.0-preview2-bin-hadoop2.7.tgz)
  
This image uses first approach.  
  
Base image should have python installed  
> FROM python:3.5-buster  
  
Installing openjdk-8-jdk  
RUN echo "deb http://deb.debian.org/debian/ sid main" >> /etc/apt/sources.list  
RUN apt update -y && apt upgrade -y  
RUN apt install -y openjdk-8-jdk  
  
Installing python stuffs  
RUN pip install sklearn && pip install matplotlib && pip install seaborn && pip install pyspark && pip install pytrends  
  
Copying spark files  
COPY ./spark-3.0.0-preview2-bin-hadoop2.7 /etc/spark  
  
Creating working directory  
WORKDIR /work/   
