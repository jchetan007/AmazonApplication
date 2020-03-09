import { RxHttp, http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { vCartItem } from '@app/models';

@http({
    hostKey: "local",
    path: "api/vCartItems",
})

export class AbstractvCartItem extends RxHttp {
    vCartItemFormGroup: IFormGroup<vCartItem>
}
