import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ProductSubCategoryBase {

//#region productSubCategoryId Prop
        @prop()
        productSubCategoryId : number;
//#endregion productSubCategoryId Prop


//#region productSubCategoryName Prop
        @required()
        @maxLength({value:50})
        productSubCategoryName : string;
//#endregion productSubCategoryName Prop


//#region productCategoryId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        productCategoryId : number;
//#endregion productCategoryId Prop





}