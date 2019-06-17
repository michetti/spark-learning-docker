Run a spark cluster using docker-compose, with 1 master and 1 slave node.

### Building docker image
```
docker build -t manduca/spark:latest
```

### Running spark cluster
```
docker-compose up
```

### Running spark-shell
```
docker-compose exec spark-master spark-shell --master spark://spark-master:7077
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

### Stopping spark cluster
You can `Control+C` or run:
```
docker-compose down
```

