# Dockerfile
FROM ghcr.io/flox/flox

# Set environment variables using ENV
ENV HELLO_ENV_VARIABLE="Hello from Dockerfile"

# Set build-time arguments using ARG
ARG HELLO_BUILD_ARG
ENV HELLO_BUILD_ARG=${HELLO_BUILD_ARG}

COPY print_vars.sh /print_vars
RUN chmod 777 /print_vars

CMD /print_vars
