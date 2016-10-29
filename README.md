 

# nginx tomee mysql servers guide:

1. install docker and docker-compose

2. cd && mkdir -p .reactor/logs/ && mkdir -p mount_dockers/mysql

3. echo "index in log" > ~/.reactor/logs/index.html

4. git clone https://github.com/zhiyinglei/ntm_servers.git

# From cloud
a. download images

     docker pull zhiyinglei/ntm_servers -a

b. cd ntm_servers

c. start services 
  
     docker-compose up -d
     
# From source

a. cd ntm_servers/source

b. start services 
  
     docker-compose up -d --build


6. visit localhost with your browser

   https://localhost:10443/logs/

   https://localhost:10443/rr/
   
   http://localhost:10080/logs/

   http://localhost:10080/logs/


7. mysql shell
   
   mysql -h HOST_IP -P 3306 -ureactor  -pp@ssword

8. reset database
    
    rm -rf ~/mount_dockers/mysql/ && mkdir -p ~/mount_dockers/mysql
    
    docker-compose up -d

9. stop services
    
    docker rm $(docker ps -aq) -f  # in another terminal window


# note: 

   In Nginx Server, /usr/share/nginx/html/logs will be mounted to Host ~/.reactor/logs
   
   In Mysql Server, /var/lib/mysql will be mounted to Host ~/mount_dockers/mysql
