ARG BASEIMAGE=nvidia/cuda:8.0-devel-ubuntu14.04
FROM ${BASEIMAGE}

COPY ./entrypoint /entrypoint
RUN sed -i 's/\r//' /entrypoint
RUN chmod +x /entrypoint

RUN mkdir -p /work
COPY . /work
WORKDIR /work
RUN make
ENV PATH $PATH:/work/

ENTRYPOINT ["/entrypoint"]



