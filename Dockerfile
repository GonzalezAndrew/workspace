FROM ubuntu

LABEL MAINTAINER="Andrew Gonzalez"
LABEL CONTACT="andrewgonzo23@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN yes | unminimize && \
    apt-get -y --no-install-recommends upgrade && \
    apt-get install -y \
        apt-utils \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        man-db \
        curl \
        && \
    apt-key adv \
        --keyserver keyserver.ubuntu.com \
        --recv-key C99B11DEB97541F0 \
        && \
    apt-add-repository ppa:deadsnakes && \
    apt-add-repository https://cli.github.com/packages && \
    add-apt-repository ppa:git-core/ppa && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
        vim tmux perl git gh jq sudo zsh \
        figlet tree nmap htop unzip \
        python3.10 python3.10-venv \
        libncurses5 libcurses-perl ssh sshpass sshfs rsync cifs-utils \
        bash-completion make wget less \
        && \
    cpan -I Term::Animation && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/dmesg.* && \
    cat /dev/null > /var/log/dmesg

RUN python3.10 -m ensurepip

COPY ./files/. ./Dockerfile /

WORKDIR /usr/share/andy/workspace 

RUN /usr/share/workspace/.local/bin/install-docker && \
    /usr/share/workspace/.local/bin/install-awscli && \
    /usr/share/workspace/.local/bin/install-kubectl && \
    /usr/share/workspace/.local/bin/install-bitwarden && \
    /usr/share/workspace/.local/bin/install-vault && \
    /usr/share/workspace/.local/bin/install-packer && \
    /usr/share/workspace/.local/bin/install-tfenv && \
    /usr/share/workspace/.local/bin/install-doctl && \
    /usr/share/workspace/.local/bin/install-pip-packages && \
    /usr/share/workspace/.local/bin/install-ohmyzsh && \
    /usr/share/workspace/.local/bin/install-starship

ENTRYPOINT ["sh","/entrypoint"]