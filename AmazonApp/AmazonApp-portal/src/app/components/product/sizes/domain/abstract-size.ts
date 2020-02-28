import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Size } from '@app/models';

export class AbstractSize extends RxHttp {
    sizeFormGroup: IFormGroup<Size>
}
