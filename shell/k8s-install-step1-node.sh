#!/bin/bash

echo 'k8s install start.'

rm -f /lib/systemd/system/kube-calico.service
cp ~/kubernetes-starter/target/all-node/kube-calico.service /lib/systemd/system/
systemctl daemon-reload
systemctl enable kube-calico.service
service kube-calico start

#确保相关目录存在
mkdir -p /var/lib/kubelet
mkdir -p /etc/kubernetes
mkdir -p /etc/cni/net.d

#复制kubelet服务配置文件
rm -f /lib/systemd/system/kubelet.service
cp ~/kubernetes-starter/target/worker-node/kubelet.service /lib/systemd/system/
#复制kubelet依赖的配置文件
rm -f /etc/kubernetes/kubelet.kubeconfig
cp ~/kubernetes-starter/target/worker-node/kubelet.kubeconfig /etc/kubernetes/
#复制kubelet用到的cni插件配置文件
rm -f /etc/cni/net.d/10-calico.conf
cp ~/kubernetes-starter/target/worker-node/10-calico.conf /etc/cni/net.d/
systemctl daemon-reload
systemctl enable kubelet.service
service kubelet start


#确保工作目录存在
mkdir -p /var/lib/kube-proxy
#复制kube-proxy服务配置文件
rm -f /lib/systemd/system/kube-proxy.service
cp ~/kubernetes-starter/target/worker-node/kube-proxy.service /lib/systemd/system/
#复制kube-proxy依赖的配置文件
rm -f /etc/kubernetes/kube-proxy.kubeconfig
cp ~/kubernetes-starter/target/worker-node/kube-proxy.kubeconfig /etc/kubernetes/
systemctl daemon-reload
systemctl enable kube-proxy.service
service kube-proxy start
echo 'k8s install finished.'

