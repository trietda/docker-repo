FROM arm64v8/python:slim-bullseye

RUN apt-get update
RUN apt-get install -y \
  build-essential \
  python-dev \
  libjpeg-dev \
  zlib1g-dev \
  libfreetype6-dev\
  libgeos-dev \
  libgdal-dev
RUN pip install \
  pyproj \
  Pillow \
  PyYAML \
  Shapely \
  lxml \
  six \
  MapProxy \
  uwsgi
RUN apt-get install -y curl

RUN useradd -m mapproxy

WORKDIR /home/mapproxy
COPY cmd.sh ./cmd.sh
RUN chmod -R 777 ./cmd.sh
RUN chown mapproxy:mapproxy ./cmd.sh

USER mapproxy
EXPOSE 8080/tcp
ENTRYPOINT ["./cmd.sh"]
