FROM node:alpine3.16

RUN apk --no-cache add \ 
        bash \
        curl \
        less \
        groff \
        jq \
	yarn \
        git \
        python3 \
        py3-pip \
        py-pip && \
        pip install --upgrade pip awscli s3cmd && \
        mkdir /root/.aws

RUN node -v

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
