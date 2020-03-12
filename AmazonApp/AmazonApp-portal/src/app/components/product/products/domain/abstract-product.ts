import { RxHttp,http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Product } from '@app/models';

@http({
    hostKey: "local",
    path: "api/ProductSubCategories",
})


export class AbstractProduct extends RxHttp {
    productFormGroup: IFormGroup<Product>
}
