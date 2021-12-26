#ARG BUILD_FROM
#FROM $BUILD_FROM
FROM "ghcr.io/home-assistant/armv7-base:3.13"
RUN apk update
RUN apk add --no-cache \
      openssh \
      asterisk=18.2.1-r2 \
      asterisk-sample-config=18.2.1-r2
      
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/asteriskssh -s /bin/sh -D asteriskssh
RUN echo -n 'asteriskssh:erw9fiuvi3fi3rqf' | chpasswd
RUN ssh-keygen -A
#RUN exec /usr/sbin/sshd -D -e '$@'
ENTRYPOINT [ "/init"]

COPY root /
CMD ["/usr/sbin/sshd","-D"]
