FROM fedora
#runner for old-mail-deleter app, currently in dev
MAINTAINER "langdon" <old-mail-deleter@fishump.com>

RUN yum -y update; yum clean all

RUN echo `date`
RUN echo `date`
RUN yum -y install python-pip curl libcurl-devel gcc make python-devel; yum clean all
RUN yum -y install rpm-python

RUN mkdir /src
WORKDIR /src
#RUN pip install -U rpm-python
RUN pip install -U pycurl
RUN pip install -U python-gflags
ADD . /src
RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["python", "-u", "old-mail-deleter.py"]
