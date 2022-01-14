docker build -t youssefh/multi-client:latest -t youssefh/multi-client:$SHA  -f ./client/Dockerfile ./client
docker build -t youssefh/multi-server:latest -t youssefh/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t youssefh/multi-worker:latest -t -t youssefh/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push yousseh/multi-client:latest
docker push yousseh/multi-server:latest
docker push yousseh/multi-worker:latest

docker push yousseh/multi-client:$SHA
docker push yousseh/multi-server:$SHA
docker push yousseh/multi-worker:$SHA

kubectl apply -f k8s/1
kubectl apply -f k8s/2
kubectl set image deployments/client-deployment server=youssefh/multi-client:$SHA
kubectl set image deployments/server-deployment server=youssefh/multi-server:$SHA
kubectl set image deployments/worker-deployment server=youssefh/multi-worker:$SHA

exit 0