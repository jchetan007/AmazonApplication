import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { ProductCategory } from '@app/models';

export class AbstractProductCategory extends RxHttp {
    productCategoryFormGroup: IFormGroup<ProductCategory>
}
