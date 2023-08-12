. get_cred_endpoint.sh $1
cat $2 | kibana2json | jq -c '.hits.hits[] | { index: {_index:._index, _type:._type}}, ._source' > kore.json
cat kore.json | http -a $credentials POST $endpoint/_bulk