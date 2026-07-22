// Typed models for the Tvp SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Content {
  content_id?: number
  description?: string
  metadata?: Record<string, any>
  title?: string
  token?: string
}

export interface ContentLoadMatch {
  content_id: number
}

