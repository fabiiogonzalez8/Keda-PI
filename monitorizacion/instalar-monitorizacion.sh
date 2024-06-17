# Instalador de prometheus, grafana y alertmanager en cluster Kind
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo update
helm install kind-prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --set prometheus.service.nodePort=30000 --set prometheus.service.type=NodePort --set grafana.service.nodePort=31000 --set grafana.service.type=NodePort --set alertmanager.service.nodePort=32000 --set alertmanager.service.type=NodePort --set prometheus-node-exporter.service.nodePort=32001 --set prometheus-node-exporter.service.type=NodePort

#Para acceder
# Prometheus: http://<nodeIP>:30000
# AlertManager: http://<nodeIP>:32000
# Grafana: http://<nodeIP>:31000
# Usuario y contraseña Grafana: admin | prom-operator
#kubectl port-forward service/kind-prometheus-grafana 31000:80 -n monitoring &
#kubectl port-forward service/kind-prometheus-kube-prome-alertmanager 32000:9093 -n monitoring &
#kubectl port-forward service/kind-prometheus-kube-prome-prometheus 30000:9090 -n monitoring &
