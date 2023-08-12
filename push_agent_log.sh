. get_cred_endpoint.sh $1

for i in $(find . | grep --color=never ndjson); do
  index=$(echo $i | sed -e 's,./,,' -e 's,/logs/default/,-,' -e 's,/logs/,-,')
   
  cat $i | jq -cs --arg index $index '.[] | { index: {_index: $index}}, .' |  http -a $credentials POST $endpoint/_bulk
done
