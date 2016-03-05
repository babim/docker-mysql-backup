FROM babim/debianbase

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ENV BACKUP /backup

RUN apt-get -y update && apt-get -y install mysql-client

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y --purge && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup
    
ADD ./backup.sh /backup.sh

VOLUME ["${BACKUP}"]
CMD ["/bin/bash", "/backup.sh"]

