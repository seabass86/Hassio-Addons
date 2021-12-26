ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
      openssh \
      asterisk=18.2.1-r1 \
      asterisk-sample-config=18.2.1-r1
      
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/asteriskssh -s /bin/sh -D asteriskssh
RUN echo -n 'asteriskssh:erw9fiuvi3fi3rqf' | chpasswd
RUN ssh-keygen -A
RUN exec /usr/sbin/sshd -D -e '$@'
ENTRYPOINT [ "/init"]

CMD []
COPY root /
