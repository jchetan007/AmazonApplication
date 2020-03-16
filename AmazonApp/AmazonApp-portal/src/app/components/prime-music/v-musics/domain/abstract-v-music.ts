import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { vMusic } from '@app/models';

export class AbstractvMusic extends RxHttp {
    vMusicFormGroup: IFormGroup<vMusic>
}
