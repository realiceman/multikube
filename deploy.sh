docker build -t youssefh/multi-client -f ./client/Dockerfile ./client
docker build -t youssefh/multi-server -f ./server/Dockerfile ./server
docker build -t youssefh/multi-worker -f ./worker/Dockerfile ./worker
docker push yousseh/multi-client
docker push yousseh/multi-server
docker push yousseh/multi-worker
kubectl apply -f k8s/1
kubectl apply -f k8s/2
kubectl set image deployments/server-deployment server=youssefh/multi-server 
