-- Tvp SDK error

local TvpError = {}
TvpError.__index = TvpError


function TvpError.new(code, msg, ctx)
  local self = setmetatable({}, TvpError)
  self.is_sdk_error = true
  self.sdk = "Tvp"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function TvpError:error()
  return self.msg
end


function TvpError:__tostring()
  return self.msg
end


return TvpError
