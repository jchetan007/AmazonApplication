import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { SellerDetailForm } from '@app/models';

export class AbstractSellerDetailForm extends RxHttp {
    sellerDetailFormFormGroup: IFormGroup<SellerDetailForm>
}
