<?php
declare(strict_types=1);

// Tvp SDK utility: result_headers

class TvpResultHeaders
{
    public static function call(TvpContext $ctx): ?TvpResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
