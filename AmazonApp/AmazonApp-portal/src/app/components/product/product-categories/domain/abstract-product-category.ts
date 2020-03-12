import { RxHttp, http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { ProductCategory } from '@app/models';


@http({
    hostKey:'local',
    path:'api/ProductMainCategories'
})
export class AbstractProductCategory extends RxHttp {
    productCategoryFormGroup: IFormGroup<ProductCategory>
}
