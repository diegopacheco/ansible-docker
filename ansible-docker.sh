#!/bin/bash

SHARED=$(pwd)/src/:/app/
ARG0=$2

function bake(){
   docker build -t diegopacheco/ansibledocker . --network=host
}

function run(){
   docker run -v $SHARED --rm --name ansibledocker diegopacheco/ansibledocker
}

function lint(){
  if [[ "$ARG0" = *[!\ ]* ]];
  then
    docker run -v $SHARED --rm -ti diegopacheco/ansibledocker /bin/sh -c "ansible-lint /app/$ARG0"
  else
    echo "Missing lint file! Valid sample: ./ansible-docker.sh lint main.yml"
  fi
}

function help(){
  echo "Ansible-Docker: by Diego Pacheco"
  echo "bake : bake the docker image"
  echo "run  : run whats inside src/main.yml with ansible-playbook"
  echo "lint : run ansible-lint in a specific file. .ie: ./ansible-docker.sh lint main.yml"
}

case $1 in
     "bake")
          bake
          ;;
      "run")
          run
          ;;
       "lint")
          lint
          ;;
      *)
          help
esac
