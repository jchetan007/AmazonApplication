import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Material } from '@app/models';

export class AbstractMaterial extends RxHttp {
    materialFormGroup: IFormGroup<Material>
}
