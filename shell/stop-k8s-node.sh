#!/bin/bash
service kube-calico stop
service kubelet stop
service kube-proxy stop
echo 'k8s node stoped.'
