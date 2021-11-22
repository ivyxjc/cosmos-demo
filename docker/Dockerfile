FROM ubuntu:20.04
COPY blogd /usr/bin/
RUN blogd init test2 --chain-id=namechain

COPY genesis.json $HOME/.blog/config/genesis.json
RUN sed -i 's?persistent_peers = ""?persistent_peers = "cdfe3c3a695c72896ed3276dd42b0484875b2157@192.168.32.198:26656"?g' $HOME/.blog/config/config.toml

ENTRYPOINT ["/bin/bash","-c","blogd start"]