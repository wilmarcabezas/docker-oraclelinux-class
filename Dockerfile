FROM oraclelinux:7-slim

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 12.22.1

RUN  yum -y install oracle-release-el7 && \
    yum-config-manager --disable ol7_developer_EPEL && \
    yum -y install oracle-instantclient19.3-basiclite curl && \
    yum -y groupinstall "Development Tools" && \
    rm -rf /var/cache/yum && \ 
    curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH