FROM ubuntu:24.04

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        gcc make nasm binutils curl iproute2 less vim xxd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG USERNAME=a
ARG WORKSPACE=/workspace

RUN useradd -ms /bin/bash $USERNAME && \
    mkdir -p $WORKSPACE && \
    chown -R $USERNAME:$USERNAME $WORKSPACE

USER $USERNAME
WORKDIR $WORKSPACE

CMD ["/bin/bash"]
