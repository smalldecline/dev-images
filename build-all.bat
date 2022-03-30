
docker build -t devenv:clang ./devenv-clang 
docker build -t devenv:python ./devenv-python 
docker build -t devenv:node.js ./devenv-nodejs 
docker image prune -y