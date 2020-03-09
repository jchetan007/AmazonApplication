import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { UserAddress } from '@app/models';

export class AbstractUserAddress extends RxHttp {
    userAddressFormGroup: IFormGroup<UserAddress>
}
