import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { ProductSubCategory } from '@app/models';

export class AbstractProductSubCategory extends RxHttp {
    productSubCategoryFormGroup: IFormGroup<ProductSubCategory>
}
