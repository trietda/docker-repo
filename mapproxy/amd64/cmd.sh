#!/bin/bash

mapproxy-util create -t wsgi-app -f config/mapproxy.yaml config.py
if [ "$RELOADER" == "ENABLE" ]
then
  sed -i "s/application = make_wsgi_app('examples/minimal/etc/mapproxy.yaml')/application = make_wsgi_app('examples/minimal/etc/mapproxy.yaml', reloader=True)/g" config.py
fi

uwsgi \
  --http :8080 \
  --master \
  --processes ${PROCESSES:-4} \
  --threads ${THREADS:-2} \
  --wsgi-file config.py
