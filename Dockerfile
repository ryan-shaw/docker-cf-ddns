FROM balenalib/rpi-raspbian:stretch-20200503

RUN set -e; \
    apt-get update ; \
    apt-get install cron jq

ADD /src/etc/ /etc/
ADD /src/cf-ddns.sh /

RUN touch /var/log/dns.log && \
    chmod 0644 /etc/cron.d/dyndns

CMD ["cron", "-f"]
