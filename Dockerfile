# FROM phusion/baseimage:0.9.19
FROM ubuntu:14.04
RUN apt-get update && apt-get install -y build-essential


COPY ./paml4.9d /paml
COPY ./data /paml/data
WORKDIR /paml/src
RUN make
RUN mkdir -p /paml/bin && cp /paml/src/codeml /paml/bin/

# TODO: add entry-point to take data from /data, use it as WORKDIR, and run codeml there.

CMD ["/bin/bash"]