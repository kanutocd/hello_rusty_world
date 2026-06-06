FROM ruby:3.4

ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=1000

RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    curl \
    git \
    clang \
    cmake \
    musl-tools \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu \
    && rm -rf /var/lib/apt/lists/*

# Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup target add \
    x86_64-unknown-linux-gnu \
    aarch64-unknown-linux-gnu \
    x86_64-unknown-linux-musl \
    aarch64-unknown-linux-musl 

RUN groupadd --gid ${USER_GID} ${USERNAME}
RUN useradd --uid ${USER_UID} \
            --gid ${USER_GID} \
            --create-home \
            ${USERNAME}

WORKDIR /workspace

USER ${USERNAME}

CMD ["bash"]