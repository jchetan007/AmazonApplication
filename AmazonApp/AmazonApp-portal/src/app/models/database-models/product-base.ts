import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ProductBase {

//#region productId Prop
        @prop()
        productId : number;
//#endregion productId Prop


//#region productSubCategoryId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        productSubCategoryId : number;
//#endregion productSubCategoryId Prop


//#region sellerId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        sellerId : number;
//#endregion sellerId Prop











}