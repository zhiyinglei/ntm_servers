# Docker compose for nginx, tomee, and mysql

# OS: 
  
  OS X and Ubuntu 

# Installation 

1. install docker

2. install docker compose

3. cd && mkdir -p .reactor/logs/ && mkdir -p mount_dockers/mysql

4. echo "index in log" > ~/.reactor/logs/index.html

5. git clone https://github.com/zhiyinglei/nginx_tomee_mysql.git

6. cd nginx_tomee_mysql

7. docker-compose up --build -d

8. visit localhost with your browser

   https://localhost:10443/logs/

   https://localhost:10443/rr/
   
   http://localhost:10080/logs/

   http://localhost:10080/logs/

9. mysql shell
   
   mysql -h HOST_IP -P 3306 -ureactor  -pp@ssword

10. reset database
    
    rm -rf ~/mount_dockers/mysql/ && mkdir -p ~/mount_dockers/mysql
    
    docker-compose up --build

11. stop services
    
    docker rm $(docker ps -aq) -f  # in another terminal window

# note: 

   In Nginx Server, /usr/share/nginx/html/logs will be mounted to Host ~/.reactor/logs
   
   In Mysql Server, /var/lib/mysql will be mounted to Host ~/mount_dockers/mysql
