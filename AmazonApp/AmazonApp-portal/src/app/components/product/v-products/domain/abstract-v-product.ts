import { RxHttp,http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { vProduct } from '@app/models';

@http({
    hostKey: "local",
    path: "api/vCartItems",
})


export class AbstractvProduct extends RxHttp {
    vProductFormGroup: IFormGroup<vProduct>
}
