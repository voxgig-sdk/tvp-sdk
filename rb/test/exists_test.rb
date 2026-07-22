# Tvp SDK exists test

require "minitest/autorun"
require_relative "../Tvp_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = TvpSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
