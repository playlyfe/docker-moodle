# Docker Moodle
This is the Docker Image for The Moodle LMS
Using this it becomes really easy to setup a moodle installation without setting up the apache server and MySQL databases all this is done through docker

### Step 1: Build the image
```bash
./build.sh
```

### Step 2: Run the Container
```bash
docker run -d -p 80:80 -p 3306:3306 -v /path/to/moodle:/var/www/html playlyfe/moodle
```
or
```bash
./deploy-local.sh  # with your path to moodle
```

Then headover to http://localhost or http://127.0.0.1 and there you should see the moodle installation page

### Step 3: Configure Read/Write permissions to your moodle folder
You need to might need to enter the container using docker-enter and then set the permissions for all files in the /var/www/html directory using
```bash
chmod 777 -R /var/www/html
```
Or you can just set the same permissions to your local moodle folder it might work (haven't tried it yet)

This will then allow the moodle installation script to run and configure
your files accordingly. After this you can change your permissions back

### Step 4: Installation
The Moodle installation might ask you for some details regarding your server and database

**Moodle**
```
moodle_path: /var/www/html
moodle_data_path: /var/www/moodledata
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
```bash
sudo docker-enter moodle
docker stop moodle
```

