FROM python:3.7-alpine

# Copy code to docker container
COPY ./src/helloworld.py helloworld.py

# Setup a non-root user context.
# This prevents application from overeritting itself and a good security measure 
# Required for AWS EKS > 1.14 

RUN addgroup -g 1988 arupji-helloworld-group
RUN adduser -D -s / -u 1988 arupji-helloworld-user -G arupji-helloworld-group

RUN chown 1988:1988 helloworld.py

USER 1988

ENTRYPOINT ["python", "helloworld.py"]