FROM ubuntu:latest

ADD startscript.sh /startscript.sh

#ENV PORT=8080
#To install required utilities and create a dir for application
RUN /bin/bash -c 'apt -y update; apt -y upgrade; apt -y dist-upgrade; echo "dash dash/sh boolean false" | debconf-set-selections; DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash; apt-get -y install wget; apt-get -y install unzip; apt-get install -y curl; mkdir /clnaddr; wget https://s3.runnertech.com/clnaddr/bi-monthly/clean_address_linux.zip -O clean_address_linux.zip; unzip -P BottleGuide31 clean_address_linux.zip; rm -rf clean_address_linux.zip; cd /clean_address_linux; export TERM=xterm && export HOME='/clnaddr' && yes | ./install.sh; mv -f /clean_address_linux/bin64/* /clnaddr/bin; mv -f /clean_address_linux/datafiles/* /clnaddr/datafiles; rm -rf /clean_address_linux; cd /; wget https://s3.runnertech.com/clnaddr/bi-monthly/clean_address_dpv_unix.zip -O clean_address_dpv_unix.zip; unzip -P StoreAlaska75 clean_address_dpv_unix.zip; rm -rf clean_address_dpv_unix.zip; mv -f /clean_address_dpv/datafiles/* /clnaddr/datafiles; rm -rf clean_address_dpv; chmod +x /clnaddr/bin/clnaddrws; groupadd -r clnaddr; useradd -r -g clnaddr -d /clnaddr -s /sbin/nologin -c "clnaddr" clnaddr; chown -R clnaddr:clnaddr /clnaddr; mv -f /startscript.sh /clnaddr/bin/startscript.sh; chmod +x /clnaddr/bin/startscript.sh'


# Define Working dir
WORKDIR /clnaddr/bin

# Define health check command.
HEALTHCHECK CMD curl http://localhost:8080/CLNVerify || exit 1

USER clnaddr

ENTRYPOINT ["/bin/bash", "-c", "/clnaddr/bin/startscript.sh"]

