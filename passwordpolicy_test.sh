#!/usr/bin/env bash

cd passwordpolicy_test

echo
echo "  ---> starting vm"
vagrant up --no-provision
echo "  ---> initialize vm"
vagrant provision --provision-with bootstrap
echo "  ---> installing passwordpolicy"
vagrant provision --provision-with install
echo "  ---> activating passwordpolicy"
vagrant provision --provision-with config
echo "  ---> runing tests"
vagrant provision --provision-with test
echo
echo "  ---> execute 'cd passwordpolicy_test && vagrant destroy' to remove vm."
echo
