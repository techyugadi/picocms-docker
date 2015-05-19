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

sudo docker run -d -p <mapped_port>:80 your_user/picocms

(Replace your_user by your user name. Map container port 80 to a suitable mapped_port on the docker host.)

Then connect to Pico CMS from a browser on the docker host:

http://localhost:mapped_port

# Using volumes

You may use volumes to attach a web content directory or plugin directory, or new configuration to the PicoCMS docker.

For example, since PicoCMS serves content from the /var/www/html/content-sample directory, you can start the docker with your own web-content as follows:

sudo docker run -d -v <your_content_directory>:/var/www/html/content-sample -p <mapped_port>:80 picocms
