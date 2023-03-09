#!/bin/sh
sudo docker-compose --env-file ./.env up -d --build --no-cashe
docker run -it --net host --pid host --cap-add audit_control -с container_runtime \
-e DOCKER_CONTENT_TRUST=$DOCKER_CONTENT_TRUST \
-v /var/lib:/var/lib \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /etc:/etc --label docker_bench_security \
docker/docker-bench-security