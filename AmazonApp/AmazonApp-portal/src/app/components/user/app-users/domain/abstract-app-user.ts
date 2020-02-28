import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { AppUser } from '@app/models';

export class AbstractAppUser extends RxHttp {
    appUserFormGroup: IFormGroup<AppUser>
}
