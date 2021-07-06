Manual Kubernetes
==================

##### Instalando com kubeadm
https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl


##### Iniciando Cluster
```shell
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```
##### Configurando Client (kubectl)
```shell
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
##### Configuracoes Adicionais
```shell
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
#Liberar master para rodar
kubectl taint nodes --all node-role.kubernetes.io/master-
```

