###################################################################
#                                                                 #
#                    Start of Kubenetes Update                    #
#                                                                 #
#                         Namespace: web                          #
#                                                                 #
###################################################################


# update sea-mengxin-pink
# docker build -t mengxin891029/sea-mengxin-ml:latest -t mengxin891029/sea-mengxin-ml:$GIT_SHA -f ./docker-images/sea/Dockerfile ./docker-images/sea
docker buildx build --platform linux/amd64,linux/arm64 --push -t mengxin891029/sea-mengxin-pink:latest -t mengxin891029/sea-mengxin-pink:$GIT_SHA -f ./docker-images/sea/Dockerfile ./docker-images/sea
docker push mengxin891029/sea-mengxin-pink:$GIT_SHA
docker push mengxin891029/sea-mengxin-pink:latest
kubectl apply -f k8s/web/sea-mengxin-pink
kubectl set image --namespace web deployments/sea-mengxin-pink-deployment sea-mengxin-pink=mengxin891029/sea-mengxin-pink:$GIT_SHA


# update chat-mengxin-ml
# docker build -t mengxin891029/chat-mengxin-ml:latest -t mengxin891029/chat-mengxin-ml:$GIT_SHA -f ./docker-images/chat/Dockerfile ./docker-images/chat
# docker push mengxin891029/chat-mengxin-ml:$GIT_SHA
# docker push mengxin891029/chat-mengxin-ml:latest
# docker buildx build --platform linux/amd64,linux/arm64 --push -t mengxin891029/chat-mengxin-ml:latest -t mengxin891029/chat-mengxin-ml:$GIT_SHA -f ./docker-images/chat/Dockerfile ./docker-images/chat
# kubectl apply -f k8s/web/chat-mengxin-ml
# kubectl set image --namespace web deployments/chat-mengxin-ml-deployment chat-mengxin-ml=mengxin891029/chat-mengxin-ml:$GIT_SHA


# # update tunnel-mengxin-ml
# # docker build -t mengxin891029/tunnel-mengxin-ml:latest -t mengxin891029/tunnel-mengxin-ml:$GIT_SHA -f ./docker-images/tunnel/Dockerfile ./docker-images/tunnel
# # docker push mengxin891029/tunnel-mengxin-ml:$GIT_SHA
# # docker push mengxin891029/tunnel-mengxin-ml:latest
# docker buildx build --platform linux/amd64,linux/arm64 --push -t mengxin891029/tunnel-mengxin-ml:latest -t mengxin891029/tunnel-mengxin-ml:$GIT_SHA -f ./docker-images/tunnel/Dockerfile ./docker-images/tunnel
# kubectl apply -f k8s/web/tunnel-mengxin-ml
# kubectl set image --namespace web deployments/tunnel-mengxin-ml-deployment tunnel-mengxin-ml=mengxin891029/tunnel-mengxin-ml:$GIT_SHA

# # update grpc-mengxin-ml
# # docker build -t mengxin891029/grpc-mengxin-ml:latest -t mengxin891029/grpc-mengxin-ml:$GIT_SHA -f ./docker-images/grpc/Dockerfile ./docker-images/grpc
# # docker push mengxin891029/grpc-mengxin-ml:$GIT_SHA
# # docker push mengxin891029/grpc-mengxin-ml:latest
# docker buildx build --platform linux/amd64,linux/arm64 --push -t mengxin891029/grpc-mengxin-ml:latest -t mengxin891029/grpc-mengxin-ml:$GIT_SHA -f ./docker-images/grpc/Dockerfile ./docker-images/grpc
# kubectl apply -f k8s/web/grpc-mengxin-ml
# kubectl set image --namespace web deployments/grpc-mengxin-ml-deployment grpc-mengxin-ml=mengxin891029/grpc-mengxin-ml:$GIT_SHA

# # update argo-tunnel-tunnel-mengxin-ml
# kubectl apply -f k8s/web/argo-tunnel-tunnel-mengxin-ml

# # update httpbin-mengxin-pink
kubectl apply -f k8s/web/httpbin-mengxin-pink

# # update mongo-express-mengxin-ml
# kubectl apply -f k8s/web/mongo-express-mengxin-ml

# # update jupyter-mengxin-ml
# # docker build -t mengxin891029/jupyter-mengxin-ml:latest -t mengxin891029/jupyter-mengxin-ml:$GIT_SHA -f ./docker-images/jupyter/Dockerfile ./docker-images/jupyter
# # docker push mengxin891029/jupyter-mengxin-ml:$GIT_SHA
# # docker push mengxin891029/jupyter-mengxin-ml:latest
# docker buildx build --platform linux/amd64,linux/arm64 --push -t mengxin891029/jupyter-mengxin-ml:latest -t mengxin891029/jupyter-mengxin-ml:$GIT_SHA -f ./docker-images/jupyter/Dockerfile ./docker-images/jupyter
# kubectl apply -f k8s/web/jupyter-mengxin-ml
# kubectl set image --namespace web deployments/jupyter-mengxin-ml-deployment jupyter-mengxin-ml=mengxin891029/jupyter-mengxin-ml:$GIT_SHA

# # update general kubernetes namespace: web
# kubectl apply -f k8s/web






# ###################################################################
# #                                                                 #
# #                    Start of Kubenetes Update                    #
# #                                                                 #
# #                         Namespace: tcp                          #
# #                                                                 #
# ###################################################################


# # update ssl-mengxin-ml-keyless
# # docker build -t mengxin891029/keyless:latest -t mengxin891029/keyless:$GIT_SHA -f ./docker-images/keyless/Dockerfile ./docker-images/keyless
# # docker push mengxin891029/keyless:$GIT_SHA
# # docker push mengxin891029/keyless:latest
# docker buildx build --platform linux/amd64,linux/arm64 --push -t mengxin891029/keyless:latest -t mengxin891029/keyless:$GIT_SHA -f ./docker-images/keyless/Dockerfile ./docker-images/keyless
# kubectl apply -f k8s/tcp/ssl-mengxin-ml-keyless
# kubectl set image --namespace tcp deployments/ssl-mengxin-ml-keyless-deployment ssl-mengxin-ml=mengxin891029/keyless:$GIT_SHA


# # update common-storage-nfs
# kubectl apply -f k8s/tcp/common-storage-nfs


# # update mengxin-sea1-test-vm
# kubectl apply -f k8s/tcp/mengxin-sea1-test-vm


# # update mongo-mengxin-ml
# kubectl apply -f k8s/tcp/mongo-mengxin-ml


# # update redis-mengxin-ml
# kubectl apply -f k8s/tcp/redis-mengxin-ml


# # update general kubernetes namespace: tcp
# kubectl delete validatingwebhookconfiguration admission.voyager.appscode.com
# kubectl apply -f k8s/tcp