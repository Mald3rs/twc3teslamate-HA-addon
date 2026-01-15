ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apk add --no-cache \
    python3 \
    py3-pip \
    git

WORKDIR /app

RUN git clone --depth 1 https://github.com/Haveacry/twc3teslamate.git . && \
    pip3 install --no-cache-dir --break-system-packages -r requirements.txt

COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]
