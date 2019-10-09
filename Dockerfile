FROM

# TODO checksum/signature verify?
RUN \
    wget -O- "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.46.1" \
    | tar -xzf- cf -C /usr/local/bin
