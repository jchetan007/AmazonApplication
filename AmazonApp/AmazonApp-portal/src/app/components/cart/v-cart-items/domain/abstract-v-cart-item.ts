import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { vCartItem } from '@app/models';

export class AbstractvCartItem extends RxHttp {
    vCartItemFormGroup: IFormGroup<vCartItem>
}
