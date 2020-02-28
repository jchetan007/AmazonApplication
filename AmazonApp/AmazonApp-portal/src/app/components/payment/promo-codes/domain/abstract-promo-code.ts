import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { PromoCode } from '@app/models';

export class AbstractPromoCode extends RxHttp {
    promoCodeFormGroup: IFormGroup<PromoCode>
}
