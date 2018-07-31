FROM centos:latest

#Copy startscript.sh file from lcoal to the image
ADD /gsr.sh /gsr.sh

#ENV PORT=8080
#To install required utilities and create a dir for application
#RUN /bin/bash -c 'yum -y install wget; yum -y install unzip; yum install -y curl; mkdir /clnaddr; wget http://s3.runnertech.com/clnaddr/clean_address_linux.zip -O clean_address_linux.zip; unzip -P RightHowever61 clean_address_linux.zip;chmod +x ./clean_address_linux/install.sh; HOME='/clnaddr'; yes | ./clean_address_linux/install.sh; rm -rf clean_address_linux.zip; mv -f ./clean_address_linux/bin64/* /clnaddr/bin; mv -f ./clean_address_linux/datafiles/* /clnaddr/datafiles; rm -rf clean_address_linux; wget http://s3.runnertech.com/clnaddr/clean_address_dpv_unix.zip -O clean_address_dpv_unix.zip; unzip -P FloorMelody32 clean_address_dpv_unix.zip; rm -rf clean_address_dpv_unix.zip; mv -f ./clean_address_dpv/datafiles/* /clnaddr/datafiles; rm -rf clean_address_dpv; chmod +x /clnaddr/bin/clnaddrws; mv /startscript.sh /clnaddr/bin/startscript.sh; chmod +x /clnaddr/bin/startscript.sh; groupadd -r clnaddr; useradd -r -g clnaddr -d /clnaddr -s /sbin/nologin -c "clnaddr" clnaddr; chown -R clnaddr:clnaddr /clnaddr; yum -y clean all'

# Define Working dir
#WORKDIR /clnaddr/bin

# Define health check command.
#HEALTHCHECK CMD curl http://localhost:$PORT/CLNVerify || exit 1

#USER clnaddr

#ENTRYPOINT ["/bin/bash", "-c", "/clnaddr/bin/startscript.sh"]
