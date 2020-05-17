FROM consol/ubuntu-xfce-vnc:1.4.0

USER root

# install dependencies
RUN apt-get update && apt-get install -y dos2unix 

# download and uppack Archi
RUN wget -O /var/tmp/Archi-Linux64-4.6.0.tgz https://www.archimatetool.com/downloads/19ef8fac18c/Archi-Linux64-4.6.0.tgz && tar -C /headless/Desktop -xzvf /var/tmp/Archi-Linux64-4.6.0.tgz

# clean up
RUN apt-get clean && apt-get autoclean && rm /var/tmp/Archi-Linux64-4.6.0.tgz

# add entrypoint script
ADD docker-entrypoint.sh /headless/docker-entrypoint.sh

# prepare environment
RUN mkdir -p /data/input \
    && mkdir -p /data/output \
    && dos2unix /headless/Desktop/Archi/Archi-Ubuntu.sh  \
    && chmod +x /headless/docker-entrypoint.sh

WORKDIR "/data"

VOLUME ["/data/input"]

ENTRYPOINT ["/headless/docker-entrypoint.sh"]
