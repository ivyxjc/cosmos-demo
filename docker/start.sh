#!/usr/bin/env bash

rm -rf ~/.blogd
rm -rf ~/.nameservicecli

blogd init test --chain-id=namechain

sed 's?persistent_peers = ""?persistent_peers = "cdfe3c3a695c72896ed3276dd42b0484875b2157@192.168.32.198:26656"?g'

#nameservicecli config output json
#nameservicecli config indent true
#nameservicecli config trust-node true
#nameservicecli config chain-id namechain
#nameservicecli config keyring-backend test
#
#nameservicecli keys add user1
#nameservicecli keys add user2

#blogd add-genesis-account $(nameservicecli keys show user1 -a) 1000nametoken,100000000stake
#blogd add-genesis-account $(nameservicecli keys show user2 -a) 1000nametoken,100000000stake

#blogd gentx --name user1 --keyring-backend test

echo "Collecting genesis txs..."
#blogd collect-gentxs

echo "Validating genesis file..."
blogd validate-genesis