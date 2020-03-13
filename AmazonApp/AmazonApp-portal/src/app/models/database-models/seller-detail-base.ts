import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class SellerDetailBase {

//#region sellerDetailId Prop
        @prop()
        sellerDetailId : number;
//#endregion sellerDetailId Prop


//#region companyName Prop
        @required()
        @maxLength({value:50})
        companyName : string;
//#endregion companyName Prop


//#region address Prop
        @required()
        @maxLength({value:50})
        address : string;
//#endregion address Prop


//#region panNumber Prop
        @required()
        @maxLength({value:10})
        panNumber : string;
//#endregion panNumber Prop


//#region shippingFeeDetailId Prop
        @prop()
        shippingFeeDetailId : number;
//#endregion shippingFeeDetailId Prop


//#region appUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        appUserId : number;
//#endregion appUserId Prop





}