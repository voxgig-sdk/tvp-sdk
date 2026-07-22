# frozen_string_literal: true

# Typed models for the Tvp SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Content entity data model.
#
# @!attribute [rw] content_id
#   @return [Integer, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] metadata
#   @return [Hash, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] token
#   @return [String, nil]
Content = Struct.new(
  :content_id,
  :description,
  :metadata,
  :title,
  :token,
  keyword_init: true
)

# Request payload for Content#load.
#
# @!attribute [rw] content_id
#   @return [Integer]
ContentLoadMatch = Struct.new(
  :content_id,
  keyword_init: true
)

