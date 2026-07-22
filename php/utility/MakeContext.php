<?php
declare(strict_types=1);

// Tvp SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class TvpMakeContext
{
    public static function call(array $ctxmap, ?TvpContext $basectx): TvpContext
    {
        return new TvpContext($ctxmap, $basectx);
    }
}
