###################################################################
#                                                                 #
#                    Start of Kubenetes Update                    #
#                                                                 #
#                         Namespace: default                      #
#                                                                 #
###################################################################


# update mengxin-local-default-ingress
kubectl apply -f k8s/web/mengxin-local-default-ingress.yaml


###################################################################
#                                                                 #
#                    Start of Kubenetes Update                    #
#                                                                 #
#                         Namespace: tcp                          #
#                                                                 #
###################################################################


# # update mengxin-sea1-test-vm
# kubectl apply -f k8s/tcp/mengxin-sea1-test-vm


# # update mongo-mengxin-ml
# kubectl apply -f k8s/tcp/mongo-mengxin-ml

# update postgres-mengxin-pink
kubectl apply -f k8s/tcp/postgres-mengxin-pink

# update redis-mengxin-pink
kubectl apply -f k8s/tcp/redis-mengxin-pink


# # update general kubernetes namespace: tcp
# kubectl delete validatingwebhookconfiguration admission.voyager.appscode.com
# kubectl apply -f k8s/tcp




###################################################################
#                                                                 #
#                    Start of Kubenetes Update                    #
#                                                                 #
#                         Namespace: web                          #
#                                                                 #
###################################################################


# update chat-mengxin-pink
docker buildx build --platform linux/amd64,linux/arm64 --push -t mengxin891029/chat-mengxin-pink:latest -t mengxin891029/chat-mengxin-pink:$GIT_SHA -f ./docker-images/chat/Dockerfile ./docker-images/chat
# docker push mengxin891029/chat-mengxin-pink:$GIT_SHA
# docker push mengxin891029/chat-mengxin-pink:latest
kubectl apply -f k8s/web/chat-mengxin-pink
kubectl set image --namespace web deployments/chat-mengxin-pink-deployment chat-mengxin-pink=mengxin891029/chat-mengxin-pink:$GIT_SHA


# update dns-mengxin-pink
kubectl apply -f k8s/web/dns-mengxin-pink


# # update grpc-mengxin-ml
# # docker build -t mengxin891029/grpc-mengxin-ml:latest -t mengxin891029/grpc-mengxin-ml:$GIT_SHA -f ./docker-images/grpc/Dockerfile ./docker-images/grpc
# # docker push mengxin891029/grpc-mengxin-ml:$GIT_SHA
# # docker push mengxin891029/grpc-mengxin-ml:latest
# docker buildx build --platform linux/amd64,linux/arm64 --push -t mengxin891029/grpc-mengxin-ml:latest -t mengxin891029/grpc-mengxin-ml:$GIT_SHA -f ./docker-images/grpc/Dockerfile ./docker-images/grpc
# kubectl apply -f k8s/web/grpc-mengxin-ml
# kubectl set image --namespace web deployments/grpc-mengxin-ml-deployment grpc-mengxin-ml=mengxin891029/grpc-mengxin-ml:$GIT_SHA


# update httpbin-mengxin-pink
kubectl apply -f k8s/web/httpbin-mengxin-pink


# update sea-mengxin-pink
docker buildx build --platform linux/amd64,linux/arm64 --push -t mengxin891029/sea-mengxin-pink:latest -t mengxin891029/sea-mengxin-pink:$GIT_SHA -f ./docker-images/sea/Dockerfile ./docker-images/sea
# docker push mengxin891029/sea-mengxin-pink:$GIT_SHA
# docker push mengxin891029/sea-mengxin-pink:latest
kubectl apply -f k8s/web/sea-mengxin-pink
kubectl set image --namespace web deployments/sea-mengxin-pink-deployment sea-mengxin-pink=mengxin891029/sea-mengxin-pink:$GIT_SHA


# update tunnel-mengxin-pink
kubectl apply -f k8s/web/tunnel-mengxin-pink


# update mengxin-local-web-ingress
kubectl apply -f k8s/web/mengxin-local-web-ingress.yaml

# # update general kubernetes namespace: web
# kubectl apply -f k8s/web






