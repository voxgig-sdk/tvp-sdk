# Tvp SDK configuration

module TvpConfig
  def self.make_config
    {
      "main" => {
        "name" => "Tvp",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://api.tvp.pl",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "content" => {},
        },
      },
      "entity" => {
        "content" => {
          "fields" => [
            {
              "active" => true,
              "name" => "content_id",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "description",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "metadata",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "title",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "token",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 4,
            },
          ],
          "name" => "content",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => 93573158,
                        "kind" => "param",
                        "name" => "content_id",
                        "orig" => "content_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/tokenizer/token/{content_id}",
                  "parts" => [
                    "tokenizer",
                    "token",
                    "{content_id}",
                  ],
                  "select" => {
                    "exist" => [
                      "content_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "token",
              ],
            ],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    TvpFeatures.make_feature(name)
  end
end
