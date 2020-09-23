GraphQL::Cache.configure do |config|
  config.namespace = 'GraphQL::Cache' # Cache key prefix for keys generated by graphql-cache
  config.cache     = Rails.cache      # The cache object to use for caching
  config.logger    = Rails.logger     # Logger to receive cache-related log messages
  config.expiry    = 60               # 1 minutes (in seconds)
end