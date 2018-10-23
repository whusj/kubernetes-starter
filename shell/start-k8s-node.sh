#!/bin/bash
service kube-calico start
service kubelet start
service kube-proxy start
echo 'k8s node started.'
