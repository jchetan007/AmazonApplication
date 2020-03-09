import { RxHttp, http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Order } from '@app/models';

@http({
    hostKey: "local",
    path: "api/Orders",
})

export class AbstractOrder extends RxHttp {
    orderFormGroup: IFormGroup<Order>
}
