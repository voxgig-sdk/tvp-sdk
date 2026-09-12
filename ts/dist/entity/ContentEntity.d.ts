import { TvpEntityBase } from '../TvpEntityBase';
import type { TvpSDK } from '../TvpSDK';
import type { Control } from '../types';
import type { Content, ContentLoadMatch } from '../TvpTypes';
declare class ContentEntity extends TvpEntityBase<Content> {
    constructor(client: TvpSDK, entopts: any);
    make(this: ContentEntity): ContentEntity;
    load(this: any, reqmatch?: ContentLoadMatch, ctrl?: Control): Promise<ContentEntity>;
}
export { ContentEntity };
