# frozen_string_literal: true

# Typed models for the Tvp SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Content entity data model.
class Content
end

# Request payload for Content#load.
#
# @!attribute [rw] content_id
#   @return [Integer]
ContentLoadMatch = Struct.new(
  :content_id,
  keyword_init: true
)

