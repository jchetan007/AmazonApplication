import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Seller } from '@app/models';

export class AbstractSeller extends RxHttp {
    sellerFormGroup: IFormGroup<Seller>
}
