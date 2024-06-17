install:
	echo "Configurando el cluster"
	kind create cluster --name kind-keda \
		--config kind-cluster.yaml
lb:
	echo "Configurando metallb"
	metallb/metallb.sh
delete:
	echo "Eliminando el cluster"
	kind delete cluster --name kind-keda
all: install lb
