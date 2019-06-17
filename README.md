Runs a spark cluster using _docker-compose_, with 1 master and 1 slave node.

## Building docker image

```
docker build -t manduca/spark:latest
```

## Useful commands

### Running spark cluster

```
docker-compose up
```

### Stopping spark cluster

You can `Control+C` or run:

```
docker-compose down
```

### Running spark-shell

```
docker-compose exec spark-master spark-shell --master spark://spark-master:7077
```

### Submitting an example job

```
docker-compose exec spark-master spark-submit --master spark://spark-master:7077 --class org.apache.spark.examples.SparkPi /usr/local/spark/examples/jars/spark-examples_2.11-2.4.3.jar 1000
```

### Bash access

On Master node:
```
docker-compose exec spark-master bash
```

On Slave nove:
```
docker-compose exec spark_spark-worker_1  bash
```

## Reference

https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2