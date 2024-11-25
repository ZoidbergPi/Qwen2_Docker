FROM ollama:latest
ADD ./init.sh /tmp/init.sh
WORKDIR /tmp
RUN chmox +x /tmp/init.sh && /tmp/init.sh
ADD ./startup.sh /tmp/startup.sh
ENTRYPOINT ["/bin/bash"]
CMD ["/bin/bash", "/tmp/startup.sh"]
