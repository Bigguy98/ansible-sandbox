## Setting up
To build controller image:
> docker build -t ansible-controller ansible-controller/

To build node image:
> docker build -t ansible-node ansible-node/

Start the whole sandbox including controller and nodes

> docker-compose up -d

To view all containers:
> docker ps

## Working with playbooks
Create your ansible playbook on ./playbooks folder

To interact ansible command, use this

> docker exec <container-name> <ansible-command>

For example
> docker exec ansible-sandbox-controller-1 ansible all -a hostname
