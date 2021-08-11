FROM kishorekumarkb/kishore 
ADD hello.py /home/hello.py
CMD ["/home/hello.py"]
ENTRYPOINT ["python"]
