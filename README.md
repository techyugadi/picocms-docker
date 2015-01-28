# picocms-docker
Dockerfile and other required files to build and run a Pico CMS docker on CentOS 7.
Pico CMS is a simple flat file CMS that does not need a database. It runs on most web servers like Apache. More info at : http://picocms.org/

#Dockerhub

A docker using this Dockerfile has already been published to dockerhub at :

techyugadi/picocms


# Build

To build your docker using the Dockerfile in this repository :

i. Copy the 3 files : Dockerfile , pico-httpd.conf, and run-httpd.sh to your local machine. Then from the directory where you copied the 3 files, run :

ii. sudo docker build -t="your_user/picocms" . 

(Replace your_user by your user name)

# Run

To run the docker, issue the follosing command :

sudo docker run -d -p 80 your_user/picocms

(Replace your_user by your user name)

This will start the docker, and map a random port number on your local machine to the port 80 on which an Apache Web server instance runs inside the docker. To find the random port number, run :

sudo docker ps

Then use the port number (say "port"), to connect to Pico CMS froma browser on your local machine : 

http://localhost: port
