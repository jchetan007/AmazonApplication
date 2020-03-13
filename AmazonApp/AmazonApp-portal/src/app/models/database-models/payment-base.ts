import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class PaymentBase {

//#region paymentId Prop
        @prop()
        paymentId : number;
//#endregion paymentId Prop


//#region amount Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        amount : number;
//#endregion amount Prop


//#region paymentDate Prop
        @required()
        paymentDate : any;
//#endregion paymentDate Prop


//#region promoCodeId Prop
        @prop()
        promoCodeId : number;
//#endregion promoCodeId Prop


//#region appUserId Prop
        @prop()
        appUserId : number;
//#endregion appUserId Prop







}