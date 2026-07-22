# Tvp SDK utility: make_context

from core.context import TvpContext


def make_context_util(ctxmap, basectx):
    return TvpContext(ctxmap, basectx)
