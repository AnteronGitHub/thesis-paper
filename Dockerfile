FROM aergus/latex

ARG AUTHOR_UID
ARG AUTHOR_GID

# Set locale
ENV LANG C.UTF-8

# Manage users
RUN useradd -m -s /bin/bash -u $AUTHOR_UID -g $AUTHOR_GID author

RUN apt-get update

# Utility packages
RUN apt-get install -y \
    git \
    vim

# Repository setup
COPY . /build
WORKDIR /build
RUN chown $AUTHOR_UID:$AUTHOR_GID -R /build

USER author

CMD ["/bin/bash"]
