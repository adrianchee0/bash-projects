#!/bin/bash

read -p "Enter the password length (default 16): " length

length=${length:-16}

tr -dc A-Za-z0-9_ </dev/urandom | head -c $length
echo
