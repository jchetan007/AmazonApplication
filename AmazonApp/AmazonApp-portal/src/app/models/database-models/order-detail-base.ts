import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class OrderDetailBase {

//#region orderDetailId Prop
        @prop()
        orderDetailId : number;
//#endregion orderDetailId Prop


//#region expectedDate Prop
        @required()
        expectedDate : any;
//#endregion expectedDate Prop


//#region shippingFeeDetailId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        shippingFeeDetailId : number;
//#endregion shippingFeeDetailId Prop


//#region orderId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        orderId : number;
//#endregion orderId Prop





}