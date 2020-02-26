import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ShippingDetailBase {

//#region shippingDetailId Prop
        @prop()
        shippingDetailId : number;
//#endregion shippingDetailId Prop


//#region companyName Prop
        @required()
        @maxLength({value:50})
        companyName : string;
//#endregion companyName Prop


//#region shippingDate Prop
        @required()
        shippingDate : any;
//#endregion shippingDate Prop


//#region sellerId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        sellerId : number;
//#endregion sellerId Prop



}