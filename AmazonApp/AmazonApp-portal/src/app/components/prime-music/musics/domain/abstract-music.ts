import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Music } from '@app/models';

export class AbstractMusic extends RxHttp {
    musicFormGroup: IFormGroup<Music>
}
