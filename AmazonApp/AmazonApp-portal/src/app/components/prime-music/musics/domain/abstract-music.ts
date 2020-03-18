import { RxHttp, http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Music } from '@app/models';


@http({
    hostKey: "local",
    path: "api/MusicSubCategories",
})


export class AbstractMusic extends RxHttp {
    musicFormGroup: IFormGroup<Music>
}
