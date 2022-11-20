#!/usr/bin/env bash

if [ -f .env ]
then
  export $(cat .env | xargs) 
else
    echo ".env"
    exit 1
fi

forge create ./src/MockERC20.sol:MockERC20 -i --rpc-url 'https://rpc.ankr.com/polygon_mumbai' --private-key ${PRIVATE_KEY}