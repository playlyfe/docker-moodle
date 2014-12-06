# Docker Moodle
This is the Docker Image for The Moodle LMS
Using this makes it really easy to setup a moodle installation without setting up the apache server and MySQL databases all this is done through docker

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
./deploy-local.sh /path/to/moodle
```

### Step 3: Configure Read/Write/Execute permissions to your moodle folder
Set permissions for all files in your moodle directory using
```bash
chmod 777 -R /path/to/moodle
```
This will then allow the moodle installation script to run and configure
your files accordingly. After this you can change your permissions back

### Step 4: Installation
Then headover to http://localhost or http://127.0.0.1 and there you should see the moodle installation page. The Moodle installation might ask you for some details regarding your server and database. The details for the configuration is given below

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
sudo docker-enter 
docker stop 
docker rm moodle
```

