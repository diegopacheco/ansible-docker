# ansible-docker

ansible-docker is a docker sandbox with amazonlinx(AWS ec2) and ansible in order to speed up devops coding.

# Usage

## Install
```bash
git clone https://github.com/diegopacheco/ansible-docker.git
cd ansible-docker/
./ansible-docker.sh bake
```

## Run
```bash
./ansible-docker.sh run
```
```bash
./ansible-docker.sh run
 [WARNING]: Found both group and host with same name: localhost

PLAY [127.0.0.1] ***************************************************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]

TASK [git : ensure yum is updated] *********************************************
ok: [localhost]

TASK [git : ensure Git is present] *********************************************
ok: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0  
```

## How to Add/Change Ansible?

Goto /src/main.yml and call your role. You role should be under /src/roles/. <BR>
There is a sample GIT role here: https://github.com/diegopacheco/ansible-docker/tree/master/src/roles/git/tasks
