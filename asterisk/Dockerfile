#ARG BUILD_FROM
#FROM $BUILD_FROM
FROM "ghcr.io/home-assistant/armv7-base:3.13"
RUN apk update
RUN apk add --no-cache \
      sudo \
      openssh \
      openssl \
      asterisk=18.2.1-r2 \
      asterisk-sample-config=18.2.1-r2
#RUN cd /tmp && wget https://github.com/asterisk/asterisk/archive/refs/heads/master.zip
RUN mkdir /etc/asterisk/keys
#RUN unzip /tmp/master.zip -d /tmp

RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
#RUN adduser -h /home/asteriskssh -s /bin/sh -D asteriskssh
RUN echo -n 'root:erw9fiuvi3fi3rqf' | chpasswd
RUN ssh-keygen -A
#RUN exec /usr/sbin/sshd -D -e '$@'
ENTRYPOINT [ "/init"]

COPY root /
CMD ["/usr/sbin/sshd","-D"]
