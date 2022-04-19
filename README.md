![alt text](https://user-images.githubusercontent.com/73280726/158613827-8c536687-71fe-4b8f-a59c-0b9eaf3ec5aa.png)
# Inception

This school project is to use ```docker-compose``` to set up a small infrastructure composed of different services (```Nginx```, ```Mariadb``` and ```WordPress```) under specific rules. 

The docker image of each service is built from scratch. For instance, instead of pulling ready-made image of ```nginx```, the image uses ```apt-get install nginx``` from ```Debian-Buster```.

This project needs to be done in a Virtual Machine.

![alt text](https://github.com/aprilmayjune135/images/blob/main/inception.png?raw=true)


## Usage

### 1. Set up localhost domain name in the Virtual Machine

In the virtual machine, add ```127.0.0.1 xchen.42.fr``` to ```/etc/hosts```.

### 2. Run docker

In the repository root directory, simply run command:
	```make```
	
### 3. Test containers

In the browser type url ```https://xchen.42.fr``` to visit the pre-installed WordPress website.
