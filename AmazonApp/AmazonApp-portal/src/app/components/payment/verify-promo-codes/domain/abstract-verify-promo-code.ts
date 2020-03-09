import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { PromoCode } from '@app/models';

export class AbstractVerifyPromoCode extends RxHttp {
    verifyPromoCodeFormGroup: IFormGroup<PromoCode>
}
