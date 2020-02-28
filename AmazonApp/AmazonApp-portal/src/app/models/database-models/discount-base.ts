import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class DiscountBase {

//#region discountId Prop
        @prop()
        discountId : number;
//#endregion discountId Prop


//#region sellerId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        sellerId : number;
//#endregion sellerId Prop


//#region productId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        productId : number;
//#endregion productId Prop


//#region validityFrom Prop
        @required()
        validityFrom : any;
//#endregion validityFrom Prop


//#region validityTill Prop
        @required()
        validityTill : any;
//#endregion validityTill Prop


//#region discountPrice Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        discountPrice : number;
//#endregion discountPrice Prop


//#region productCategoryId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        productCategoryId : number;
//#endregion productCategoryId Prop







}