# Tvp SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module TvpFeatures
  def self.make_feature(name)
    case name
    when "base"
      TvpBaseFeature.new
    when "ratelimit"
      TvpRatelimitFeature.new
    when "retry"
      TvpRetryFeature.new
    when "test"
      TvpTestFeature.new
    when "timeout"
      TvpTimeoutFeature.new
    else
      TvpBaseFeature.new
    end
  end
end
