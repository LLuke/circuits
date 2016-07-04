# Docker Image for circuits
#
# This image essentially packages up the circuits
# (a Python Application Framework*) and it's tool(s)
# into a Docker Image/Container.
#
# You can also use this Image as a Base Image for all your
# circuits Applications.
#
# Website: http://circuitsframework.com/
# PyPi: https://pypi.python.org/pypi/circuits
#
# Usage Examples(s)::
#     
#     $ docker run -d -v /path/to/www:/var/www prologic/circuits circuits.web /var/www
#     $ docker run -i -t prologic/circuits circuits.bench
#
# VERSION: 0.0.2
#
# Last Updated: 20141115

FROM prologic/python-runtime:2.7
MAINTAINER James Mills <prologic@shortcircuitnet.au>

#  Services
EXPOSE 80 8000 443

# Volumes
VOLUME /var/www

RUN apk -U add git && \
    rm -rf /var/cache/apk/*

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt && rm /tmp/requirements.txt

WORKDIR /app
COPY . /app/
RUN pip install .
