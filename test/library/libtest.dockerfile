FROM golang:1.16
RUN apt-get update
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# Install node.js
RUN mkdir -p /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION v14.17.0
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
ENV NODE_PATH $NVM_DIR/versions/$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH
COPY test.sh /test/test.sh
WORKDIR /test
CMD ./test.sh

