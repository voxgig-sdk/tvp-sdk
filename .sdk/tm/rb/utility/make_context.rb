# Tvp SDK utility: make_context
require_relative '../core/context'
module TvpUtilities
  MakeContext = ->(ctxmap, basectx) {
    TvpContext.new(ctxmap, basectx)
  }
end
