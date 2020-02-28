import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { PrimeMusic } from '@app/models';

export class AbstractPrimeMusic extends RxHttp {
    primeMusicFormGroup: IFormGroup<PrimeMusic>
}
