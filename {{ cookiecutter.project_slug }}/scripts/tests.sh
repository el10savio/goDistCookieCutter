#!/usr/bin/env bash

echo "Provisioning Cluster"
scripts_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
bash "${scripts_dir}"/provision.sh 3 > /dev/null 2>&1

echo "Cluster Sanity Tests"
bats --tap "${scripts_dir}"/bats/cluster-sanity.bats