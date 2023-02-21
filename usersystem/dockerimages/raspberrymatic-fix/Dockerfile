FROM ghcr.io/jens-maus/raspberrymatic:latest
RUN sed  -i 's|res.append("location", redirect);|res.removeHeader("location");res.append("location", redirect);|' /bin/ha-proxy.js