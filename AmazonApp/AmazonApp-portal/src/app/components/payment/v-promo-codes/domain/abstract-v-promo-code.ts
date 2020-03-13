import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { vPromoCode } from '@app/models';

export class AbstractvPromoCode extends RxHttp {
    vPromoCodeFormGroup: IFormGroup<vPromoCode>
}
