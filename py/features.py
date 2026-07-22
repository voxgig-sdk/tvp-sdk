# Tvp SDK feature factory

from feature.base_feature import TvpBaseFeature
from feature.test_feature import TvpTestFeature


def _make_feature(name):
    features = {
        "base": lambda: TvpBaseFeature(),
        "test": lambda: TvpTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
