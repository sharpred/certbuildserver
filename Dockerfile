FROM debian:jessie

RUN apt-get update && apt-get -y upgrade\
   && apt-get install -y cron bash git wget python-pip sudo
RUN mkdir -p /src /home/root/.ssh /keys

RUN pip install -U setuptools==18.5 pip 
RUN pip install pyOpenSSL==16.2.0

WORKDIR /src


RUN git clone https://github.com/certbot/certbot.git
RUN /src/certbot/certbot-auto -n certificates
RUN pip install --no-cache-dir --editable /src/certbot/certbot-dns-route53