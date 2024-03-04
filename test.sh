# docker volume rm srcs_mariadb_data srcs_wordpress_data
rm -rf srcs/data/mariadb/*
rm -rf srcs/data/wordpress/*
# docker volume prune -f
# docker system prune -af

#!/bin/bash

# 볼륨 이름 정의

#  docker run --rm -it -v srcs_mariadb_data:/docker alpine:edge