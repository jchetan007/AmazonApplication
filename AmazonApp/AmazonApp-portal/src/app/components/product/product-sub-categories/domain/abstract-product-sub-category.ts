import { RxHttp,http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { ProductSubCategory } from '@app/models';

@http({
    hostKey:'local',
    path:'api/ProductCategories'
})
export class AbstractProductSubCategory extends RxHttp {
    productSubCategoryFormGroup: IFormGroup<ProductSubCategory>
}
