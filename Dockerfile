FROM ubuntu:latest

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update && \
    apt-get install -y git python python-pip mongodb-org

WORKDIR /tmp
COPY run.sh /tmp/run.sh

RUN git clone https://github.com/mongodb/mongo-perf.git && \
    cd mongo-perf/ && \
    pip install -r requirements.txt && \
    chmod a+x /tmp/run.sh && \
    python benchrun.py --help
