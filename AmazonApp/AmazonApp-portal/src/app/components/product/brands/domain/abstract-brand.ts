import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Brand } from '@app/models';

export class AbstractBrand extends RxHttp {
    brandFormGroup: IFormGroup<Brand>
}
