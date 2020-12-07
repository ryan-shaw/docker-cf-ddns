FROM ubuntu:20.04

RUN set -e; \
    apt-get update ; \
    apt-get install -yq cron jq

ADD /src/etc/ /etc/
ADD /src/cf-ddns.sh /

RUN touch /var/log/dns.log && \
    chmod 0644 /etc/cron.d/dyndns

CMD ["cron", "-f"]
