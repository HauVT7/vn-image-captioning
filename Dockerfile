FROM ubuntu:20.04
WORKDIR /app
#COPY environment.yml /app/
COPY requirements.txt /app/
RUN apt-get update -y && apt-get install -y ffmpeg libsm6 libxext6  
RUN apt update --fix-missing -y && apt upgrade -y
RUN apt-get install -y python3-pip python3-dev -y wget
COPY . /app
RUN pip3 install streamlit && \
    pip3 install Cython && \  
    pip3 install pycocotools==2.0.0 && \
    pip3 install -r requirements.txt
EXPOSE 8501
ENTRYPOINT ["streamlit", "run"]
CMD ["test.py"]