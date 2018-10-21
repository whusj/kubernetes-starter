#!/bin/bash

echo 'k8s install start.'
#把服务配置文件copy到系统服务目录
rm -f /lib/systemd/system/etcd.service
cp ~/kubernetes-starter/target/master-node/etcd.service /lib/systemd/system/
systemctl daemon-reload
#enable服务
systemctl enable etcd.service
#创建工作目录(保存数据的地方)
mkdir -p /var/lib/etcd
# 启动服务
service etcd start

rm -f /lib/systemd/system/kube-apiserver.service
cp ~/kubernetes-starter/target/master-node/kube-apiserver.service /lib/systemd/system/
systemctl daemon-reload
systemctl enable kube-apiserver.service
service kube-apiserver start

rm -f /lib/systemd/system/master-node/kube-controller-manager.service
cp ~/kubernetes-starter/target/master-node/kube-controller-manager.service /lib/systemd/system/
systemctl daemon-reload
systemctl enable kube-controller-manager.service
service kube-controller-manager start

rm -f /lib/systemd/system/kube-scheduler.service
cp ~/kubernetes-starter/target/master-node/kube-scheduler.service /lib/systemd/system/
systemctl daemon-reload
systemctl enable kube-scheduler.service
service kube-scheduler start

rm -f /lib/systemd/system/kube-calico.service
cp ~/kubernetes-starter/target/all-node/kube-calico.service /lib/systemd/system/
systemctl daemon-reload
systemctl enable kube-calico.service
service kube-calico start

#指定apiserver地址（ip替换为你自己的api-server地址）
kubectl config set-cluster kubernetes  --server=http://192.168.202.61:8080
#指定设置上下文，指定cluster
kubectl config set-context kubernetes --cluster=kubernetes
#选择默认的上下文
kubectl config use-context kubernetes

echo 'k8s install finished.'

