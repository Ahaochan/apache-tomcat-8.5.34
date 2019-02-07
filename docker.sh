#!/bin/bash

if [ ! -f "./ROOT.war" ]; then echo -e 'ROOT.war not exists'; fi;
if [ $# -ne 1 ]; then echo -e 'usage ./docker.sh {run|restart|rebuild|rm|logs}'; exit 1; fi;


case $1 in
    "run")
        docker-compose up;;
    "restart")
        docker-compose up --no-recreate;;
    "rebuild")
        docker-compose build web
        docker-compose up --no-deps -d web
        ;;
    "rm")
        docker-compose rm -f;;
    "logs")
        docker-compose logs;;
    *)
        echo -e 'usage ./docker.sh {run|restart|rebuild|rm|logs}';;
esac