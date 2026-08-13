# Tvp SDK configuration


def make_config():
    return {
        "main": {
            "name": "Tvp",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://api.tvp.pl",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "content": {},
            },
        },
        "entity": {
      "content": {
        "fields": [],
        "name": "content",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 93573158,
                      "kind": "param",
                      "name": "content_id",
                      "orig": "content_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                      "index$": 0,
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/tokenizer/token/{content_id}",
                "parts": [
                  "tokenizer",
                  "token",
                  "{content_id}",
                ],
                "select": {
                  "exist": [
                    "content_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.metadata`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [
            [
              "token",
            ],
          ],
        },
      },
    },
    }
