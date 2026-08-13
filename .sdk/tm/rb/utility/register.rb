# Tvp SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

TvpUtility.registrar = ->(u) {
  u.clean = TvpUtilities::Clean
  u.done = TvpUtilities::Done
  u.make_error = TvpUtilities::MakeError
  u.feature_add = TvpUtilities::FeatureAdd
  u.feature_hook = TvpUtilities::FeatureHook
  u.feature_init = TvpUtilities::FeatureInit
  u.fetcher = TvpUtilities::Fetcher
  u.make_fetch_def = TvpUtilities::MakeFetchDef
  u.make_context = TvpUtilities::MakeContext
  u.make_options = TvpUtilities::MakeOptions
  u.make_request = TvpUtilities::MakeRequest
  u.make_response = TvpUtilities::MakeResponse
  u.make_result = TvpUtilities::MakeResult
  u.make_point = TvpUtilities::MakePoint
  u.make_spec = TvpUtilities::MakeSpec
  u.make_url = TvpUtilities::MakeUrl
  u.param = TvpUtilities::Param
  u.prepare_auth = TvpUtilities::PrepareAuth
  u.prepare_body = TvpUtilities::PrepareBody
  u.prepare_headers = TvpUtilities::PrepareHeaders
  u.prepare_method = TvpUtilities::PrepareMethod
  u.prepare_params = TvpUtilities::PrepareParams
  u.prepare_path = TvpUtilities::PreparePath
  u.prepare_query = TvpUtilities::PrepareQuery
  u.graphql_body = TvpUtilities::GraphqlBody
  u.graphql_errors = TvpUtilities::GraphqlErrors
  u.result_basic = TvpUtilities::ResultBasic
  u.result_body = TvpUtilities::ResultBody
  u.result_headers = TvpUtilities::ResultHeaders
  u.transform_request = TvpUtilities::TransformRequest
  u.transform_response = TvpUtilities::TransformResponse
}
