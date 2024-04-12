# Use a base image with SSH server installed
FROM ubuntu:latest

LABEL maintainer="bugsmaker"

# Install OpenSSH server, python3 and sudo
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
       openssh-server \
       sudo \
    && rm -rf /var/lib/apt/lists/*

    
RUN mkdir /run/sshd && chmod 0755 /run/sshd

# Create an ansible user
RUN useradd -ms /bin/bash ansible \
    && echo 'ansible:ansible' | chpasswd \
    && usermod -aG sudo ansible

# Enable passwordless sudo for the ansible user
RUN echo 'ansible ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ansible



# Expose SSH port
EXPOSE 22

# Set the SSH server to start on container startup
CMD ["/usr/sbin/sshd", "-D"]
