 

# nginx tomee mysql servers 

1. install docker and docker-compose

2. cd && mkdir -p .reactor/logs/ && mkdir -p mount_dockers/mysql

3. echo "index in log" > ~/.reactor/logs/index.html

4. download images

     docker pull zhiyinglei/nginx_tomee_mysql -a
     
5. git clone https://github.com/zhiyinglei/ntm_servers.git

6. cd ntm_servers

7. start services 
  
     docker-compose up -d
     

8. visit localhost with your browser

   https://localhost:10443/logs/

   https://localhost:10443/rr/
   
   http://localhost:10080/logs/

   http://localhost:10080/logs/


9. mysql shell
   
   mysql -h HOST_IP -P 3306 -ureactor  -pp@ssword

10. reset database
    
    rm -rf ~/mount_dockers/mysql/ && mkdir -p ~/mount_dockers/mysql
    
    docker-compose up -d

11. stop services
    
    docker rm $(docker ps -aq) -f  # in another terminal window


# note: 

   In Nginx Server, /usr/share/nginx/html/logs will be mounted to Host ~/.reactor/logs
   
   In Mysql Server, /var/lib/mysql will be mounted to Host ~/mount_dockers/mysql
