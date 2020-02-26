import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class OrderBase {

//#region orderId Prop
        @prop()
        orderId : number;
//#endregion orderId Prop


//#region createdDate Prop
        @required()
        createdDate : any;
//#endregion createdDate Prop


//#region appUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        appUserId : number;
//#endregion appUserId Prop


//#region promoCodeId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        promoCodeId : number;
//#endregion promoCodeId Prop









}