FROM clearlinux:latest
EXPOSE 3579
WORKDIR /usr/local
RUN swupd bundle-add unzip wget -y
RUN wget https://image.easyeda.com/files/EasyEDA-Router-latest.zip
RUN unzip -q EasyEDA-Router-latest.zip
RUN rm EasyEDA-Router-latest.zip mac64.sh win64.bat
RUN rm -rf jre/mac64 jre/win64
RUN swupd bundle-remove unzip wget -y
RUN swupd clean -y
RUN sed -i 's/"127.0.0.1"/"0.0.0.0"/g' config/local/main.json
RUN chmod +x /usr/local/lin64.sh
ENTRYPOINT /usr/local/lin64.sh
