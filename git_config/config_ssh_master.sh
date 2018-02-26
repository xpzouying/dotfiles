#!/bin/bash

mkdir -p $HOME/.ssh/cm_socket/

cat <<EOT >> $HOME/.ssh/cm_socket/config
Host *
ControlMaster auto
ControlPath ~/.ssh/cm_socket/%r@%h:%p
EOT
