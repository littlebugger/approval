FROM perl:5.24.0
MAINTAINER revolee

RUN cpanm Carton

RUN mkdir /app
RUN mkdir /app/logs
WORKDIR /app

COPY cpanfile /app/
#RUN carton install --deployment
RUN carton install

COPY . /app
CMD ./start_app