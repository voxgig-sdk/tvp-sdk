# Tvp SDK configuration

module TvpConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "Tvp",
        "slug" => "tvp",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
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
          "fields" => [],
          "name" => "content",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => 93573158,
                        "kind" => "param",
                        "name" => "content_id",
                        "orig" => "content_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
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
                    "res" => "`body.metadata`",
                  },
                },
              ],
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
