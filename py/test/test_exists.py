# Tvp SDK exists test

import pytest
from tvp_sdk import TvpSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = TvpSDK.test(None, None)
        assert testsdk is not None
