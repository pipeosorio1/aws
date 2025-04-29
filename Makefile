docker:
	docker compose up --build -d

docker-log:
	docker logs aws-toolbox

exec:
	docker exec -it aws-toolbox bash