import { RxHttp, http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { AppUser } from '@app/models';


@http({
    hostKey: "local",
    path: "api/AppUsers",
})
export class AbstractAppUser extends RxHttp {
    appUserFormGroup: IFormGroup<AppUser>
}
