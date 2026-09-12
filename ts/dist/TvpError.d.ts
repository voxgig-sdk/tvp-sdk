import { Context } from './Context';
declare class TvpError extends Error {
    isTvpError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { TvpError };
