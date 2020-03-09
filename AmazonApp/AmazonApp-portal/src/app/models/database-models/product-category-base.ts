import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ProductCategoryBase {

//#region productCategoryId Prop
        @prop()
        productCategoryId : number;
//#endregion productCategoryId Prop


//#region productCategoryName Prop
        @required()
        @maxLength({value:50})
        productCategoryName : string;
//#endregion productCategoryName Prop


//#region storeId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        storeId : number;
//#endregion storeId Prop


//#region productMainCategoryId Prop
        @prop()
        productMainCategoryId : number;
//#endregion productMainCategoryId Prop









}