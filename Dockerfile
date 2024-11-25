FROM ollama/ollama:latest
ADD ./init.sh /tmp/init.sh
WORKDIR /tmp
RUN chmod +x /tmp/init.sh && /tmp/init.sh
ADD ./startup.sh /tmp/startup.sh
ENTRYPOINT [""]
CMD ["/tmp/startup.sh"]
