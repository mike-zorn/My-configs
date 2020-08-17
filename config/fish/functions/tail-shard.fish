function tail-shard -a stream -a shard_id
  set stream $argv[1]
  set shardId $argv[2]
  set iter (aws kinesis get-shard-iterator --stream-name $stream --shard-id $shardId --shard-iterator-type LATEST | jq -r .ShardIterator)
  set tmpfile (mktemp)
  while true
    aws kinesis get-records --shard-iterator $iter > $tmpfile
    set iter (cat $tmpfile | jq -r .NextShardIterator)
    cat $tmpfile | jq -r .Records[].Data | parallel echo {} | base64 --decode | go run ./record/decoder
  end
end
