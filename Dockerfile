# recommended latest rust image
FROM rust:latest

# install system dependenciess
RUN apt update && apt install \
  pkg-config \
  libssl-dev \
  make \
  gcc

# install ICANN RDAP Server
RUN cargo install icann-rdap-srv

# make data dir
RUN mkdir data

# copy in the example files
COPY *.json data/

# create an .env file
RUN echo "RDAP_SRV_LOG=debug" > .env
RUN echo "RDAP_SRV_DATA_DIR=data" >> .env
RUN echo "RDAP_BASE_URL=http://localhost:3000/rdap" >> .env

# create entrypoint.sh
RUN echo 'rdap-srv-data srv-help --notice "this is a test server"' > entrypoint.sh
RUN echo 'rdap-srv-data entity --handle foo1234 --email joe@example.com --full-name "Joe User"' >> entrypoint.sh
RUN echo 'rdap-srv-data nameserver --ldh ns1.example.com --registrant foo1234' >> entrypoint.sh
RUN echo 'rdap-srv-data domain --ldh example.com --registrant foo1234 --ns ns1.example.com' >> entrypoint.sh
RUN echo 'rdap-srv' >> entrypoint.sh
RUN chmod +x entrypoint.sh

# start the server
ENTRYPOINT ./entrypoint.sh
