. get_cred_endpoint.sh $1

# http -a $credentials GET $endpoint


# cat agg.json | http -a $credentials GET $endpoint/items-v1-20230119/_search 
# cat noagg.json | http -a $credentials GET $endpoint/items-v1-20230119/_search 

http -a $credentials GET $endpoint/_nodes | jq ._nodes
