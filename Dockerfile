FROM alpine:3.8
MAINTAINER "martin.ellinger@twofour.de"

ENV POSTFIX_SMTP_TLS_SECURITY_LEVEL=may
ENV POSTFIX_DOMAIN=''
ENV POSTFIX_SMTP_TLS_POLICY_MAPS=''

COPY src /
RUN postfix-setup

VOLUME /var/spool/postfix

ENTRYPOINT ["postfix-entrypoint"]
CMD ["/usr/lib/postfix/master", "-d"]
