#!/bin/sh -l

set -xe
sh -c "mkdir -p /root/.ssh"
echo ${INPUT_SSH_KEY} > /root/.ssh/id_rsa
sh -c "chmod 600 /root/.ssh/id_rsa"
sh -c "ssh-keyscan github.com >> /root/.ssh/known_hosts"
sh -c "chmod 700 /root/.ssh/"
sh -c "chmod 755 /root/.ssh/known_hosts"
sh -c "aws configure set region ${aws_region}"
sh -c "aws configure set aws_access_key_id ${aws_access_key_id}"
sh -c "aws configure set aws_secret_access_key ${aws_secret_access_key}"
sh -c "aws eks update-kubeconfig --region ${aws_region} --name ${cluster_name} --alias ${kubeconfig_cluster_name}"

sh -c "$*"
