. get_cred_endpoint.sh $1
cat data.json | http  -a $credentials POST $endpoint/_bulk