import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class OtpBase {

//#region otpId Prop
        @prop()
        otpId : number;
//#endregion otpId Prop


//#region otpNumber Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        otpNumber : number;
//#endregion otpNumber Prop


//#region validFrom Prop
        @required()
        validFrom : any;
//#endregion validFrom Prop


//#region validTill Prop
        @required()
        validTill : any;
//#endregion validTill Prop


//#region mobileNumber Prop
        @required()
        @maxLength({value:20})
        mobileNumber : string;
//#endregion mobileNumber Prop

}