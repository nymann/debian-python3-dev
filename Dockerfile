ARG DEBIAN_VERSION=bookworm

FROM nymann/debian-python3:$DEBIAN_VERSION
RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        make \
        git \
        python3-pip \
        python3-venv && \
    rm -rf /var/lib/apt/lists/*

USER $USERNAME
ENV APP_DIR="$HOME/app"
RUN mkdir "$APP_DIR"
WORKDIR "$APP_DIR"

RUN python3 -m venv $VENV && \
    pip install --upgrade pip setuptools wheel
