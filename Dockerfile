FROM ubuntu
RUN apt-get update
RUN apt-get install -y python3
ADD hello.py /home/hello.py
CMD ["/home/hello.py"]
ENTRYPOINT ["python3"]
