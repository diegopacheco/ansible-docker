#!/bin/bash

function bake(){
   docker build -t diegopacheco/ansibledocker . --network=host
}

function run(){
   docker run --rm --name ansibledocker diegopacheco/ansibledocker
}

function help(){
  echo "Ansible-Docker: by Diego Pacheco"
  echo "bake: bake the docker image"
  echo "run : run whats inside src/main.yml with ansible-playbook"
}

case $1 in
     "bake")
          bake
          ;;
      "run")
          run
          ;;
      *)
          help
esac
