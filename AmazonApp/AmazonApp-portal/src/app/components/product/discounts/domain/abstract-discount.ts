import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Discount } from '@app/models';

export class AbstractDiscount extends RxHttp {
    discountFormGroup: IFormGroup<Discount>
}
