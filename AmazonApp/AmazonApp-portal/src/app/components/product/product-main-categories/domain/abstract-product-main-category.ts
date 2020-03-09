import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { ProductMainCategory } from '@app/models';

export class AbstractProductMainCategory extends RxHttp {
    productMainCategoryFormGroup: IFormGroup<ProductMainCategory>
}
