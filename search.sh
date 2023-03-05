. get_credential.sh $1
endpoint=$(ecctl deployment show $1 | jq -r '.resources.elasticsearch[0].info.metadata | (.endpoint + ":" +  (.ports.https|tostring))')
url="https://$endpoint"
http -a $credentials GET $url
