. get_cred_endpoint.sh $1

split -l 1000 kibana.json segment

for i in $(ls -1 | grep segment); do

    cat $i | kibana2json | jq -c '. | { index: {_index: "kibana_log"}}, .' | http -a $credentials $endpoint/_bulk

done

