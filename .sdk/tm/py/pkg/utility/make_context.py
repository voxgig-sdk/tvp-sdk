# Tvp SDK utility: make_context

from projectname_sdk.core.context import TvpContext


def make_context_util(ctxmap, basectx):
    return TvpContext(ctxmap, basectx)
