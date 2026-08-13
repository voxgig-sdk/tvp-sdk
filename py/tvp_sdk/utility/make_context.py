# Tvp SDK utility: make_context

from tvp_sdk.core.context import TvpContext


def make_context_util(ctxmap, basectx):
    return TvpContext(ctxmap, basectx)
