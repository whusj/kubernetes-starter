#!/bin/bash
#删除K8S所有环境,需要重新配置
echo 'k8s clean start.'
#删除services
kubectl delete services nginx-service

#删除deployments
kubectl delete deploy kubernetes-bootcamp
kubectl delete deploy nginx-deployment

#停掉worker节点的服务
service kubelet stop && rm -fr /var/lib/kubelet/*
service kube-proxy stop && rm -fr /var/lib/kube-proxy/*
service kube-calico stop

#停掉master节点的服务
service kube-calico stop
service kube-scheduler stop
service kube-controller-manager stop
service kube-apiserver stop
service etcd stop

service kube-proxy stop
service kubelet stop
service kube-calico stop
service kube-scheduler stop
service kube-controller-manager stop
service kube-apiserver stop

rm -f /etc/kubernetes/
rm -f /lib/systemd/system/kube-apiserver.service
rm -f /lib/systemd/system/kube-controller-manager.service
rm -f /lib/systemd/system/kube-calico.service
rm -f /lib/systemd/system/kube-scheduler.service
rm -f /lib/systemd/system/kube-calico.service
rm -f /lib/systemd/system/kubelet.service
rm -f /lib/systemd/system/kube-proxy.service
rm -f /lib/systemd/system/etcd.service
rm -rf /root/.kube
rm -rf /etc/kubernetes/ca
rm -rf /var/lib/etcd

systemctl daemon-reload
echo 'k8s clean finished.'

