<?php
declare(strict_types=1);

// Tvp SDK exists test

require_once __DIR__ . '/../tvp_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = TvpSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
