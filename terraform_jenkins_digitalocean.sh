#!/usr/bin/env bash
##-------------------------------------------------------------------
## @copyright 2017 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## File: terraform_jenkins_digitalocean.sh
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## --
## Created : <2018-02-07>
## Updated: Time-stamp: <2018-02-07 17:14:37>
##-------------------------------------------------------------------
set -e

function get_terraform_task_id() {
    localhost vm_hostname=${1?}
    echo "$vm_hostname"
}

function terraform_create_vm() {
    terraform_task_id=${1?}
    vm_hostname=${2?}
    ssh_keys=${3?}
    volume_list=${4?}
    provision_sh=${5:-""}
}

vm_hostname=${1?}
ssh_keys=${2?}
volume_list=${3?}
provision_sh=${4:-""}
working_dir=${5:-"."}

cd "$working_dir"
terraform_task_id=$(get_terraform_task_id "$vm_hostname")
mkdir -p "$working_dir/$terraform_task_id"
cd "$working_dir/$terraform_task_id"

terraform_create_vm "$terraform_task_id" "$vm_hostname"
## File: terraform_jenkins_digitalocean.sh ends
