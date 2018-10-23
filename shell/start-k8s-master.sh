#!/bin/bash
service etcd start
service kube-apiserver start
service kube-controller-manager start
service kube-scheduler start
service kube-calico start
echo 'k8s master started.'
