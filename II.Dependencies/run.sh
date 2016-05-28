#!/usr/bin/env bash

echo "#####################################################"
echo "### Check installed packages globally             ###"
echo "#####################################################"
pip list
echo ""


echo "#####################################################"
echo "### Create virtual environment                    ###"
echo "#####################################################"
virtualenv dependencies
source dependencies/bin/activate
echo ""


echo "#####################################################"
echo "### Check installed packages in environment       ###"
echo "#####################################################"
pip list
echo ""


echo "#####################################################"
echo "### Install requests package in environment       ###"
echo "#####################################################"
pip install requests
echo ""


echo "#####################################################"
echo "### Check installed packages in environment       ###"
echo "#####################################################"
pip list
echo ""


echo "#####################################################"
echo "### Clean (deactivate & remove environment)       ###"
echo "#####################################################"
deactivate
rm -rf dependencies
echo ""