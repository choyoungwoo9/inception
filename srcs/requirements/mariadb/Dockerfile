# syntax=docker/dockerfile:1
FROM debian:bullseye-20240211

RUN apt-get update && \
	apt-get install mariadb-server-10.5 -y

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["start.sh"]

CMD ["mysqld"]