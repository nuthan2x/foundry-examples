#!/usr/bin/env bash

if [ -f .env ]
then
  export $(cat .env | xargs) 
else
    echo "Please set your .env file"
    exit 1
fi

echo "Please enter the token contract address..."
read token
echo "Deploying faucet for the token $token..."

forge create ./src/Faucet.sol:Faucet -i --rpc-url 'https://rpc.ankr.com/polygon_mumbai' --private-key ${PRIVATE_KEY} --constructor-args $token