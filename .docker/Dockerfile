FROM python:slim-bookworm

# Set Variables
# ARG ...

# Copy setup script
COPY setup-docker-container.sh /tmp

# Install all applications
RUN /tmp/setup-docker-container.sh install base-all

WORKDIR /workspace
