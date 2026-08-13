<?php
declare(strict_types=1);

// Tvp SDK configuration

class TvpConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "Tvp",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://api.tvp.pl",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "content" => [],
                ],
            ],
            "entity" => [
        'content' => [
          'fields' => [],
          'name' => 'content',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'active' => true,
                  'args' => [
                    'params' => [
                      [
                        'active' => true,
                        'example' => 93573158,
                        'kind' => 'param',
                        'name' => 'content_id',
                        'orig' => 'content_id',
                        'reqd' => true,
                        'type' => '`$INTEGER`',
                        'index$' => 0,
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/tokenizer/token/{content_id}',
                  'parts' => [
                    'tokenizer',
                    'token',
                    '{content_id}',
                  ],
                  'select' => [
                    'exist' => [
                      'content_id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.metadata`',
                  ],
                  'index$' => 0,
                ],
              ],
              'key$' => 'load',
            ],
          ],
          'relations' => [
            'ancestors' => [
              [
                'token',
              ],
            ],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return TvpFeatures::make_feature($name);
    }
}
