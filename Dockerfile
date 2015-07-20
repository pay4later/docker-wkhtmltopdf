FROM ubuntu:14.04
MAINTAINER Andrew Mackrodt <andrew.mackrodt@pay4later.com>

RUN apt-get -q -y install software-properties-common wget
RUN apt-add-repository multiverse && apt-get -q -y update

RUN wget -q http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb; \
    apt-get -q -y -f install

RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get -q -y install ttf-mscorefonts-installer

ENTRYPOINT ["wkhtmltopdf"]

CMD ["-h"]