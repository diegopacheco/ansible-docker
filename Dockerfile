FROM amazonlinux:latest
WORKDIR /
RUN yum update -y
RUN yum group install "Development Tools" -y
RUN yum install -y git
RUN yum install -y python-jinja2 python-paramiko PyYAML make MySQL-python
RUN yum install -y python-setuptools python-pip
RUN python-pip install --upgrade pip
RUN yum install -y gcc
RUN yum install -y libffi-devel openssl-devel
RUN yum install python34-devel -y
RUN yum install python27-devel python27-setuptools python34-setuptools -y
RUN git clone https://github.com/ansible/ansible.git && \
    cd ansible && \
    git checkout -b stable-2.4 origin/stable-2.4 && \
    git submodule update --init --recursive && \
    make install
RUN mkdir /etc/ansible/ && \
    echo "[localhost]" > /etc/ansible/hosts && \
    echo "localhost ansible_connection=local" >> /etc/ansible/hosts && \
    echo "export ANSIBLE_INVENTORY=~/ansible_hosts" >> /etc/profile
COPY . .
CMD ["/usr/local/bin/ansible-playbook","/app/main.yml"]
