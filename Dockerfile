FROM ubuntu:14.04
MAINTAINER Andrew Mackrodt <andrew.mackrodt@pay4later.com>

# enable multiverse
RUN sed -r -i 's/^(# *)?deb[ -].+trusty-?.+$/\0 multiverse/' /etc/apt/sources.list

# install wget
RUN apt-get -q -y update && \
	apt-get -q -y install wget && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /var/cache/*

# install wkhtmltopdf
RUN wget -q http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb; \
    apt-get -q -y update && \
    apt-get -q -y install -f && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /var/cache/* wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

# install ttf-mscorefonts-installer
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get -q -y update && \
    apt-get -q -y install ttf-mscorefonts-installer && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /var/cache/* && \
	bash -c '[[ -f /usr/share/fonts/truetype/msttcorefonts/Arial.ttf ]] || echo "msttcorefonts error" >&2; exit 1'

ENTRYPOINT ["wkhtmltopdf"]

CMD ["-h"]