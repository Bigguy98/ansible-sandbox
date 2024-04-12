## Setting up
To build controller image:
> docker build -t ansible-controller ansible-controller/

To build node image:
> docker build -t ansible-node ansible-node/

Start the whole sandbox including controller and nodes

> docker-compose up -d

To view all containers:
> docker ps

![image](https://github.com/Bigguy98/ansible-sandbox/assets/27953500/4a334c76-6664-4c3f-8335-b7426decd3c8)

## Working with playbooks
Create your ansible playbook on ./playbooks folder

To interact ansible command, use this

> docker exec `container-name` `ansible-command`

For example
> docker exec ansible-sandbox-controller-1 ansible all -a hostname

You will see something like this:

![image](https://github.com/Bigguy98/ansible-sandbox/assets/27953500/c8a654c6-5cd7-4075-b52f-62100f362e8c)

