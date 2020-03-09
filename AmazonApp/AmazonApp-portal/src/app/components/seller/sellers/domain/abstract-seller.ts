import { RxHttp, http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Seller } from '@app/models';

@http({
    hostKey: "local",
    path: "api/SellerDetailForms",
})

export class AbstractSeller extends RxHttp {
    sellerFormGroup: IFormGroup<Seller>
}
