![alt text](https://user-images.githubusercontent.com/73280726/158613827-8c536687-71fe-4b8f-a59c-0b9eaf3ec5aa.png)
# Inception

This school project is to use docker-compose to set up a small infrastructure composed of different services (Nginx, Mariadb and WordPress) under specific rules. 

This project needs to be done in a Virtual Machine.


## Usage

### 1. Set up localhost domain name in the Virtual Machine

In the virtual machine, add ```127.0.0.1 xchen.42.fr``` to ```/etc/hosts```.

### 2. Run docker

In the repository root directory, simply run command:
	```make```
	
### 3. Test containers

In the browser type url ```https://xchen.42.fr``` to visit the pre-installed WordPress website.
