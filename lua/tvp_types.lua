-- Typed models for the Tvp SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Content
---@field content_id? number
---@field description? string
---@field metadata? table
---@field title? string
---@field token? string

---@class ContentLoadMatch
---@field content_id number

local M = {}

return M
