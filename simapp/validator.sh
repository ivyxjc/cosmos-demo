simd init t1 --chain-id simapp
simd keys delete validator
#simd keys delete bob
simd keys add validator
#simd keys add bob
simd add-genesis-account $(simd keys show validator -a) 20000token,200000000stake
#simd add-genesis-account $(simd keys show bob -a) 10000token,100000000stake
simd gentx validator 100000000stake --chain-id=simapp
simd collect-gentxs
cat <<< $(jq '.app_state.gov.voting_params.voting_period = "20s"' $HOME/.simapp/config/genesis.json) > $HOME/.simapp/config/genesis.json


export DAEMON_NAME=simd
export DAEMON_HOME=$HOME/.simapp
export DAEMON_RESTART_AFTER_UPGRADE=true

mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
mkdir -p $DAEMON_HOME/cosmovisor/upgrades/1.0/bin

cp simd_1 $DAEMON_HOME/cosmovisor/genesis/bin/simd
cp simd_2 $DAEMON_HOME/cosmovisor/upgrades/1.0/bin/simd

cosmovisor start

