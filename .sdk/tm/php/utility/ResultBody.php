<?php
declare(strict_types=1);

// Tvp SDK utility: result_body

class TvpResultBody
{
    public static function call(TvpContext $ctx): ?TvpResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
