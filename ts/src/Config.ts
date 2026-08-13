
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'Tvp',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: 'https://api.tvp.pl',

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      content: {
      },

    }
  }


  entity = {
    "content": {
      "fields": [],
      "name": "content",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "active": true,
              "args": {
                "params": [
                  {
                    "active": true,
                    "example": 93573158,
                    "kind": "param",
                    "name": "content_id",
                    "orig": "content_id",
                    "reqd": true,
                    "type": "`$INTEGER`",
                    "index$": 0
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/tokenizer/token/{content_id}",
              "parts": [
                "tokenizer",
                "token",
                "{content_id}"
              ],
              "select": {
                "exist": [
                  "content_id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.metadata`"
              },
              "index$": 0
            }
          ],
          "key$": "load"
        }
      },
      "relations": {
        "ancestors": [
          [
            "token"
          ]
        ]
      }
    }
  }
}


const config = new Config()

export {
  config
}

