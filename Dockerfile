FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl vim bash-completion
RUN curl -L https://github.com/docker/machine/releases/download/v0.9.0/docker-machine-`uname -s`-`uname -m` > /tmp/docker-machine && chmod +x /tmp/docker-machine && cp /tmp/docker-machine /usr/local/bin/docker-machine
RUN curl -o /etc/bash_completion.d/docker-machine-prompt.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-prompt.bash
RUN curl -o /etc/bash_completion.d/docker-machine-wrapper.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash
RUN curl -o /etc/bash_completion.d/docker-machine.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash

WORKDIR /root

ADD ./root /root

VOLUME /root

ENTRYPOINT ["/bin/bash"]
