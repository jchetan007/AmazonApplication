import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Order } from '@app/models';

export class AbstractOrder extends RxHttp {
    orderFormGroup: IFormGroup<Order>
}
