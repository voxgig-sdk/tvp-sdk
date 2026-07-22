<?php
declare(strict_types=1);

// Tvp SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class TvpFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new TvpBaseFeature();
            case "test":
                return new TvpTestFeature();
            default:
                return new TvpBaseFeature();
        }
    }
}
