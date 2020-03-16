import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { VerifyLogin } from '@app/models';

export class AbstractVerifyLogin extends RxHttp {
    verifyLoginFormGroup: IFormGroup<VerifyLogin>
}
