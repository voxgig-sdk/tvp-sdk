-- Tvp SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "Tvp",
      slug = "tvp",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["transport"] = "base",
      },
    },
    options = {
      base = "https://api.tvp.pl",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["content"] = {},
      },
    },
    entity = {
      ["content"] = {
        ["fields"] = {},
        ["name"] = "content",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = 93573158,
                      ["kind"] = "param",
                      ["name"] = "content_id",
                      ["orig"] = "content_id",
                      ["reqd"] = true,
                      ["type"] = "`$INTEGER`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tokenizer/token/{content_id}",
                ["parts"] = {
                  "tokenizer",
                  "token",
                  "{content_id}",
                },
                ["select"] = {
                  ["exist"] = {
                    "content_id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.metadata`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {
            {
              "token",
            },
          },
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
