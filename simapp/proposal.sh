simd tx gov submit-proposal software-upgrade 1.0 --title upgrade --description upgrade --upgrade-height 15 --from validator --yes --chain-id=simapp
sleep 5
simd tx gov deposit 1 10000000stake --from validator --chain-id=simapp --yes
sleep 5
simd tx gov vote 1 "yes" --from validator --chain-id=simapp --yes
