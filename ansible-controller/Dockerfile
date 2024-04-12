# Use a base image with Python and Ansible pre-installed
FROM python:3.8-slim

LABEL maintainer="bugsmaker"

# Set environment variables
ENV ANSIBLE_VERSION 2.10.*

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ssh \
       git \
       openssh-client \
       sshpass \
       && rm -rf /var/lib/apt/lists/*

# Install Ansible
RUN pip install ansible==${ANSIBLE_VERSION}

# Create a directory for Ansible playbooks
RUN mkdir -p /ansible/playbooks

# Set the working directory
WORKDIR /ansible/playbooks

# Optionally, you can mount your playbooks directory as a volume
#VOLUME /ansible/playbooks

# Default command
CMD ["ansible-playbook", "--version"]
