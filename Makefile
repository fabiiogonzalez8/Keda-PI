install:
	echo "Configurando el cluster"
	kind create cluster --name kind-keda \
		--config kind-cluster.yaml
delete:
	echo "Eliminando el cluster"
	kind delete cluster --name kind-keda
