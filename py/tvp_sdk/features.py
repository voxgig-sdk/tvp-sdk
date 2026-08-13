# Tvp SDK feature factory

from tvp_sdk.feature.base_feature import TvpBaseFeature
from tvp_sdk.feature.test_feature import TvpTestFeature


def _make_feature(name):
    features = {
        "base": lambda: TvpBaseFeature(),
        "test": lambda: TvpTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
