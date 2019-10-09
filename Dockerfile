FROM ubuntu

RUN apt-get update && apt-get -y --no-install-recommends install ca-certificates curl && rm -rf /var/lib/apt/lists/*

# TODO checksum/signature verify?
RUN \
    curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.46.1" \
    | tar -xzf- -C /usr/local/bin cf

COPY entrypoint.sh /cf.sh
RUN chmod +x cf.sh
ENTRYPOINT /cf.sh
