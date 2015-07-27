#!/bin/bash

cd /root
chmod 700 .ssh
cd .ssh
mv id_rsa.pub authorized_keys
chmod 600 authorized_keys
