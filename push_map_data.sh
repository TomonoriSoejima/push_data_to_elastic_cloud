. get_cred_endpoint.sh $1

# create mapping
# http -a $credentials put $url/people < mapping.json 
http get https://randomuser.me/api/?results=100 | \
jq -c '.results[] | { index: {_index:"people", _id:.login.uuid }},  .location += {geo: (.location.coordinates.latitude + "," +  .location.coordinates.longitude)} | del (.location.coordinates, .picture, .info, .login)' > output.json
cat output.json | http --quiet -a $credentials POST $endpoint/_bulk