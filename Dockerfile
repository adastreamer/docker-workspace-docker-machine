FROM ubuntu:16.04

RUN apt-get update && apt-get install -y build-essential curl vim bash-completion python python-dev
RUN curl -sL https://deb.nodesource.com/setup_6.x -o /usr/bin/nodesource_setup.sh && chmod +x /usr/bin/nodesource_setup.sh && /usr/bin/nodesource_setup.sh && apt-get install -y nodejs
RUN locale-gen en_US.UTF-8 && update-locale
RUN curl -L https://github.com/docker/machine/releases/download/v0.9.0/docker-machine-`uname -s`-`uname -m` > /tmp/docker-machine && chmod +x /tmp/docker-machine && cp /tmp/docker-machine /usr/local/bin/docker-machine
RUN curl -o /etc/bash_completion.d/docker-machine-prompt.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-prompt.bash
RUN curl -o /etc/bash_completion.d/docker-machine-wrapper.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash
RUN curl -o /etc/bash_completion.d/docker-machine.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash

RUN curl -L https://github.com/sourcelair/xterm.js/archive/2.3.2.tar.gz | tar xvz -C /usr/local/share
RUN ln -s /usr/local/share/xterm.js-2.3.2 /usr/local/share/xterm.js
RUN cd /usr/local/share/xterm.js && npm install && npm run build

ADD ./root /root_init
ADD ./xterm.js /usr/local/share/xterm.js/app
ADD ./run.sh /

VOLUME /root

WORKDIR /root

CMD ["/run.sh"]

