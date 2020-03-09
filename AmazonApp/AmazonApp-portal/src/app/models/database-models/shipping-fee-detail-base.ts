import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ShippingFeeDetailBase {

//#region shippingFeeDetailId Prop
        @prop()
        shippingFeeDetailId : number;
//#endregion shippingFeeDetailId Prop


//#region localAmount Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        localAmount : number;
//#endregion localAmount Prop


//#region regionalAmount Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        regionalAmount : number;
//#endregion regionalAmount Prop


//#region nationalAmount Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        nationalAmount : number;
//#endregion nationalAmount Prop


//#region applicationObjectId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        applicationObjectId : number;
//#endregion applicationObjectId Prop



}