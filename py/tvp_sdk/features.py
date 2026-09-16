# Tvp SDK feature factory

from tvp_sdk.feature.base_feature import TvpBaseFeature
from tvp_sdk.feature.ratelimit_feature import TvpRatelimitFeature
from tvp_sdk.feature.retry_feature import TvpRetryFeature
from tvp_sdk.feature.test_feature import TvpTestFeature
from tvp_sdk.feature.timeout_feature import TvpTimeoutFeature


_FEATURES = {
    "base": lambda: TvpBaseFeature(),
    "ratelimit": lambda: TvpRatelimitFeature(),
    "retry": lambda: TvpRetryFeature(),
    "test": lambda: TvpTestFeature(),
    "timeout": lambda: TvpTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
