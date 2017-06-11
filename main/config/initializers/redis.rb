redis_server = 'localhost'
redis_port = 6379
redis_db_num = 0
url = "redis://#{redis_server}:#{redis_port}/#{redis_db_num}"
$redis_cnn = Redis.new(host: redis_server, port: redis_port, db: redis_db_num, :timeout => 1)
$cache_redis = Redis::Namespace.new(:cache, :redis => $redis_cnn)