docker network create monitoring

docker run -d --name=grafana --network monitoring -p 3000:3000 \
grafana/grafana:9.5.15

docker run -d --name prometheus --network monitoring -p 9099:9090 \
-v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml \
-v /tmp/prometheus:/prometheus \
--user 472:472 \
prom/prometheus:v2.48.1 --config.file=/etc/prometheus/prometheus.yml \
--storage.tsdb.path=/prometheus --storage.tsdb.retention.time=36500d
