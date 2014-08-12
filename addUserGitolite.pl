#!/usr/bin/env bash

#set -x
conf="/ws/alvaraju/hpncode3/sdn/gitolite-admin/conf/gitolite.conf"

groupLine=$(cat $conf|grep "\@devs_aether =")
if [[ $groupLine == "" ]]; then
    echo "Gitolite group not found!"
    exit 1
fi
user=$(echo ${groupLine}|grep "alvaraju")
if [[ ${user} == "" ]]; then
    echo "User not in group"
    set -x
    sed -i'' -e 's/'"${groupLine}"'/'"${groupLine} alvaraju"'/' ${conf}
    set +x
    else
    echo "User already in group"
    exit 1
fi
