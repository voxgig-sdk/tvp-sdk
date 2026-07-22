<?php
declare(strict_types=1);

// Tvp SDK utility: prepare_body

class TvpPrepareBody
{
    public static function call(TvpContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
