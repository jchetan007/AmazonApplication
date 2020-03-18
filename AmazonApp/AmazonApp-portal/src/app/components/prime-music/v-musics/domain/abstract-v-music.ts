import { RxHttp, http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { vMusic } from '@app/models';



@http({
    hostKey: "local",
    path: "api/Musics",
})

export class AbstractvMusic extends RxHttp {
    vMusicFormGroup: IFormGroup<vMusic>
}
