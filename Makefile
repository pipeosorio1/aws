docker:
	docker compose up --build -d

docker-log:
	docker logs aws-toolbox

exec:
	docker exec -it aws-toolbox bash

argo:
	docker exec aws-toolbox kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d && echo

grafana:
	docker exec aws-toolbox kubectl get secret prometheus-grafana -n prometheus -o jsonpath='{.data.admin-password}' | base64 -d && echo