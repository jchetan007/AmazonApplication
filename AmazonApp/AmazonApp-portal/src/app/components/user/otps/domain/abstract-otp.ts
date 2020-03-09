import { RxHttp, http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Otp } from '@app/models';


@http({
    hostKey: "local",
    path: "api/Otps",
})

export class AbstractOtp extends RxHttp {
    otpFormGroup: IFormGroup<Otp>
}
