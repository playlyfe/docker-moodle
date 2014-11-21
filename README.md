# Docker Moodle
This is the Docker Image for The Moodle LMS
Using this it becomes really easy to setup a moodle installation without setting up the apache server and MySQL databases all this is done through docker

To start the container run
```bash
docker run -d -p 80:80 -p 3306:3306 -v /path/to/moodle:/var/www/html playlyfe/moodle
```

or run
```bash
./deploy-local.sh  # with your path to moodle
```

Then headover to http://localhost or http://127.0.0.1 and there you should see the moodle installation page

You need to might need to enter the container using docker-enter and then set the permissions for all files in the /var/www/html directory using
```bash
chmod 777 -R /var/www/html
```
Or you can just set the same permissions to your local moodle folder  

This will then allow the moodle installation script to run and configure
your files accordingly. After this you can change your permissions back

The Moodle installation might ask you for some details regarding your server and database

**Moodle**
```
moodle_path: /var/www/html
moodle_data_path /var/www/moodledata
```

**Apache Server**
```
host: localhost
```

**MySQL Database**
```
host: localhost
port: 3306
user: moodleuser
password: moodle
```

**Container**
To start and stop and remove the container your can use the container name which moodle
```bash
docker stop moodle
```

