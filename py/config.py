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
        "fields": [
          {
            "active": True,
            "name": "content_id",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "description",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "metadata",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "title",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "token",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
        ],
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
                  "res": "`body`",
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
