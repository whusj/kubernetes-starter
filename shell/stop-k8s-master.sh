#!/bin/bash
service etcd stop
service kube-apiserver stop
service kube-controller-manager stop
service kube-scheduler stop
service kube-calico stop
echo 'k8s master stoped.'
