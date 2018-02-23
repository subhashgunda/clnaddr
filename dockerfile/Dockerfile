FROM centos:latest

#ENV PORT=8080
#To install required utilities and create a dir for application
RUN /bin/bash -c 'yum -y install wget; yum -y install unzip; yum install -y curl; mkdir /clnaddr'

#Download cleanaddress zip files...download links sbuject to change
#RUN /bin/bash -c 'wget https://runneredq.box.com/shared/static/vnhaocw8s1qtak3rkrkee0hxm3cl6svo.zip -O clean_address_linux.zip; wget https://runneredq.box.com/shared/static/eq9mi80tvl60ampzegaeudzwgaebgmnx.zip -O clean_address_dpv_unix.zip'
RUN /bin/bash -c 'wget https://runneredq.box.com/shared/static/vnhaocw8s1qtak3rkrkee0hxm3cl6svo.zip -O clean_address_linux.zip'

# Exract the downloaded ZIP files supplying password.
#ADD clean_address_linux.zip ./clean_address_linux.zip
#ADD clean_address_dpv_unix.zip ./clean_address_dpv_unix.zip
#RUN /bin/bash -c 'unzip -P ArrivedFlier37 clean_address_linux.zip -d ./clean_address_linux; unzip -P DestroyAcross55 clean_address_dpv_unix.zip'
#RUN /bin/bash -c 'unzip -P ArrivedFlier37 clean_address_linux.zip; unzip -P DestroyAcross55 clean_address_dpv_unix.zip'
RUN /bin/bash -c 'unzip -P ArrivedFlier37 clean_address_linux.zip'

RUN /bin/bash -c 'HOME='/clnaddr'; yes | ./clean_address_linux/install.sh'

#Move the files and delete ZIP and extracted driectories
#RUN /bin/bash -c 'rm -rf clean_address_dpv_unix.zip; rm -rf clean_address_linux.zip; mv -f ./clean_address_linux/bin64/* /clnaddr/bin; mv -f ./clean_address_linux/datafiles/* /clnaddr/datafiles; rm -rf clean_address_linux; mv -f ./clean_address_dpv/datafiles/* /clnaddr/datafiles; rm -rf clean_address_dpv'
RUN /bin/bash -c 'rm -rf clean_address_linux.zip; mv -f ./clean_address_linux/bin64/* /clnaddr/bin; mv -f ./clean_address_linux/datafiles/* /clnaddr/datafiles; rm -rf clean_address_linux'

RUN /bin/bash -c 'wget https://runneredq.box.com/shared/static/eq9mi80tvl60ampzegaeudzwgaebgmnx.zip -O clean_address_dpv_unix.zip'
RUN /bin/bash -c 'unzip -P DestroyAcross55 clean_address_dpv_unix.zip'
RUN /bin/bash -c 'rm -rf clean_address_dpv_unix.zip; mv -f ./clean_address_dpv/datafiles/* /clnaddr/datafiles; rm -rf clean_address_dpv'

# Change permissions
RUN /bin/bash -c 'chmod +x /clnaddr/bin/clnaddrws'

#Copy startscript.sh file from lcoal to the image
ADD startscript.sh /clnaddr/bin/startscript.sh

# Add clnaddr user and group and update file system to that ownership.
RUN /bin/bash -c 'groupadd -r clnaddr; useradd -r -g clnaddr -d /clnaddr -s /sbin/nologin -c "clnaddr" clnaddr; chown -R clnaddr:clnaddr /clnaddr'

# Define Working dir
WORKDIR /clnaddr/bin

# Define health check command.
HEALTHCHECK CMD curl http://localhost:$PORT/CLNVerify || exit 1

USER clnaddr

ENTRYPOINT ["/bin/bash", "-c", "/clnaddr/bin/startscript.sh"]

