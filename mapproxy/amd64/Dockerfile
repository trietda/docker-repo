FROM python:slim-bullseye

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
  MapProxy
RUN apt-get install -y curl

RUN useradd -m mapproxy
USER mapproxy
WORKDIR /home/mapproxy

RUN mapproxy-util create -t base-config ./

EXPOSE 8080/tcp
CMD ["mapproxy-util", "serve-develop", "--bind=0.0.0.0:8080", "mapproxy.yaml"]

