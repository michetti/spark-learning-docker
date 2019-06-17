FROM openjdk:8-alpine

ENV SPARK_HOME=/usr/local/spark

# all in one command to keep image small
RUN apk --no-cache add \
    wget \
    tar \
    bash \
    procps \
    coreutils \
  && wget http://mirrors.advancedhosters.com/apache/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz \
  && tar -xzf spark-2.4.3-bin-hadoop2.7.tgz \
  && mv spark-2.4.3-bin-hadoop2.7 $SPARK_HOME \
  && rm spark-2.4.3-bin-hadoop2.7.tgz

# add spark to path
ENV PATH="$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin"

# export default master env variables
ENV SPARK_MASTER_HOST=spark-master
ENV SPARK_MASTER_PORT=7077
ENV SPARK_MASTER_WEBUI_PORT=8080

# export default worker env variables
ENV SPARK_WORKER_INSTANCES=1
ENV SPARK_WORKER_WEBUI_PORT=8081

# copy non daemon start scripts
COPY scripts/* $SPARK_HOME/sbin/
