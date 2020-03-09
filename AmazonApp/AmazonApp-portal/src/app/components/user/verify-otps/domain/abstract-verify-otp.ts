import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Otp } from '@app/models';

export class AbstractVerifyOtp extends RxHttp {
    verifyOtpFormGroup: IFormGroup<Otp>
}
