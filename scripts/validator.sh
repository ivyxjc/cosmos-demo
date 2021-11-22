blogd init t1 --chain-id blog
blogd keys delete alice
blogd keys delete bob
blogd keys add alice
blogd keys add bob
blogd add-genesis-account $(blogd keys show alice -a) 20000token,200000000stake
blogd add-genesis-account $(blogd keys show bob -a) 10000token,100000000stake
blogd gentx alice 100000000stake --chain-id=blog
blogd collect-gentxs
cat <<< $(jq '.app_state.gov.voting_params.voting_period = "20s"' $HOME/.blog/config/genesis.json) > $HOME/.blog/config/genesis.json

export DAEMON_NAME=blogd
export DAEMON_HOME=$HOME/.blog
export DAEMON_RESTART_AFTER_UPGRADE=true

mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
mkdir -p $DAEMON_HOME/cosmovisor/upgrades/1.0/bin

cp blogd_1 $DAEMON_HOME/cosmovisor/genesis/bin/blogd
cp blogd_2 $DAEMON_HOME/cosmovisor/upgrades/1.0/bin/blogd

cosmovisor start

