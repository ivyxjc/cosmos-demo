blogd tx gov submit-proposal software-upgrade 1.0 --title upgrade --description upgrade --upgrade-height 20 --from alice --yes
sleep 5
blogd tx gov deposit 1 10000000stake --from alice --yes
sleep 5
blogd tx gov vote 1 "yes" --from alice --yes
