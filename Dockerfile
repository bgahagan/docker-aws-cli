FROM alpine:3.3

# Install awscli
ARG CLI_VERSION=1.16.209
RUN apk add --no-cache py-pip && \
    pip install awscli==$CLI_VERSION

# Create an aws launcher that explicity uses HOME=/home
# This allows the container to be run as the user's id and group,
# and still be possible to mount aws credentials at /home/.aws
RUN mkdir /home/aws
RUN echo '#!/bin/sh' > /aws && \
    echo 'export HOME=/home/aws' >> /aws && \
    echo 'exec aws "$@"' >> /aws && \
    chmod a+x /aws

# Create a working directory. This can be mounted at run time.
RUN mkdir /project
WORKDIR /project

# Entry point in the launcher script
ENTRYPOINT ["/aws"]
