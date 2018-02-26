FROM centos:latest

#Copy startscript.sh file from lcoal to the image
ADD startscript.sh /startscript.sh

#ENV PORT=8080
#To install required utilities and create a dir for application
RUN /bin/bash -c 'yum -y install wget; yum -y install unzip; yum install -y curl; mkdir /clnaddr; wget https://runneredq.box.com/shared/static/vnhaocw8s1qtak3rkrkee0hxm3cl6svo.zip -O clean_address_linux.zip; unzip -P ArrivedFlier37 clean_address_linux.zip;chmod +x ./clean_address_linux/install.sh; HOME='/clnaddr'; yes | ./clean_address_linux/install.sh; rm -rf clean_address_linux.zip; mv -f ./clean_address_linux/bin64/* /clnaddr/bin; mv -f ./clean_address_linux/datafiles/* /clnaddr/datafiles; rm -rf clean_address_linux; wget https://runneredq.box.com/shared/static/eq9mi80tvl60ampzegaeudzwgaebgmnx.zip -O clean_address_dpv_unix.zip; unzip -P DestroyAcross55 clean_address_dpv_unix.zip; rm -rf clean_address_dpv_unix.zip; mv -f ./clean_address_dpv/datafiles/* /clnaddr/datafiles; rm -rf clean_address_dpv; chmod +x /clnaddr/bin/clnaddrws; mv /startscript.sh /clnaddr/bin/startscript.sh; groupadd -r clnaddr; useradd -r -g clnaddr -d /clnaddr -s /sbin/nologin -c "clnaddr" clnaddr; chown -R clnaddr:clnaddr /clnaddr; yum -y clean all'

# Define Working dir
WORKDIR /clnaddr/bin

# Define health check command.
HEALTHCHECK CMD curl http://localhost:$PORT/CLNVerify || exit 1

USER clnaddr

ENTRYPOINT ["/bin/bash", "-c", "/clnaddr/bin/startscript.sh"]