
import { Context } from './Context'


class TvpError extends Error {

  isTvpError = true

  sdk = 'Tvp'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  TvpError
}

