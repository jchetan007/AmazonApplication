import { RxHttp, http} from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { PrimeMusic } from '@app/models';

@http({
    hostKey: "local",
    path: "api/PrimeMusics",
})

export class AbstractPrimeMusic extends RxHttp {
    primeMusicFormGroup: IFormGroup<PrimeMusic>
}
