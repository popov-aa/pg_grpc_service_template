FROM ghcr.io/userver-framework/ubuntu-22.04-userver-base:latest

# Setup clang toolchain, add "user" user
COPY scripts/docker/setup-dev.sh /userver_tmp/
RUN chmod +x /userver_tmp/setup-dev.sh && /userver_tmp/setup-dev.sh && rm -rf /userver_tmp

# Install postgresql server
RUN \
  apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    pycodestyle && \
  apt clean all

EXPOSE 8080-8100