# syntax=docker/dockerfile:1
FROM debian:bullseye-20240211

RUN apt-get update && \
	apt-get install mariadb-11.2 -y

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["start.sh"]

CMD ["mysqld"]