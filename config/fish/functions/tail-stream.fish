function tail-stream -a stream -d "tail a kinesis stream"
  set stream $argv[1]
  aws kinesis describe-stream --stream-name $stream | jq -r .StreamDescription.Shards[].ShardId | parallel --lb tail-shard $stream {}
end
