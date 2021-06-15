FROM ubuntu

LABEL MAINTAINER="Andrew Gonzalez"
LABEL CONTACT="andrewgonzo23@gmail.com"

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV DEBIAN_FRONTEND=noninteractive
ENV USER=${USERNAME}

RUN : \
    && yes | unminimize \
    && apt-get -y --no-install-recommends upgrade \
    && apt-get install -y \
        apt-utils \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        man-db \
        curl \
    && apt-key adv \
        --keyserver keyserver.ubuntu.com \
        --recv-key C99B11DEB97541F0 \
    && apt-add-repository ppa:deadsnakes \
    && apt-add-repository https://cli.github.com/packages \
    && add-apt-repository ppa:git-core/ppa \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
        vim tmux perl git gh jq sudo zsh \
        tree nmap htop unzip \
        python3.10 python3.10-venv \
        libncurses5 libcurses-perl ssh sshpass sshfs rsync cifs-utils \
        bash-completion make wget less \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

RUN python3.10 -m ensurepip

RUN : \
    &&  groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/zsh --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo wget \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && :

COPY ./files/. ./Dockerfile /

WORKDIR /usr/share/${USERNAME}/workspace 

RUN : \
    && /usr/share/workspace/.local/bin/install-docker \
    && /usr/share/workspace/.local/bin/install-awscli \
    # && /usr/share/workspace/.local/bin/install-kubectl \
    && /usr/share/workspace/.local/bin/install-bitwarden \
    # && /usr/share/workspace/.local/bin/install-vault \
    # && /usr/share/workspace/.local/bin/install-packer \
    && /usr/share/workspace/.local/bin/install-tfenv \
    && /usr/share/workspace/.local/bin/install-doctl \
    && /usr/share/workspace/.local/bin/install-pip-packages \
    && /usr/share/workspace/.local/bin/install-ohmyzsh \
    && /usr/share/workspace/.local/bin/install-starship \
    &&  :

RUN rsync -qvaz /usr/share/workspace/ "/home/${USERNAME}"
RUN chown -R $USERNAME:$USERNAME "/home/${USERNAME}"

WORKDIR "/home/${USERNAME}"
USER ${USERNAME}

ENTRYPOINT [ "/bin/zsh" ]
CMD [ "-l" ]