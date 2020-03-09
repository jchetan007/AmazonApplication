import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { CartItem } from '@app/models';

export class AbstractCartItem extends RxHttp {
    cartItemFormGroup: IFormGroup<CartItem>
}
