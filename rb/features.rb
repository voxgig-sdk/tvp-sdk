# Tvp SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module TvpFeatures
  def self.make_feature(name)
    case name
    when "base"
      TvpBaseFeature.new
    when "test"
      TvpTestFeature.new
    else
      TvpBaseFeature.new
    end
  end
end
