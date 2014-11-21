#!/bin/bash
LC_ALL="en_US.utf8"
LANG="en_US.UTF-8"
LANGUAGE="en_US.UTF-8"

if [ $# -eq 0 ]; then
  echo 'Please provide the path to your moodle location'
else
  docker run -d --name moodle -p 80:80 -p 3306:3306 -v $1:/var/www/html playlyfe/moodle
fi

