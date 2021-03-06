FROM kibana:latest

RUN apt-get update && apt-get install -y netcat

COPY ./files/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

RUN kibana plugin --install elastic/sense
RUN kibana plugin --install elasticsearch/marvel/latest

CMD ["/tmp/entrypoint.sh"]
