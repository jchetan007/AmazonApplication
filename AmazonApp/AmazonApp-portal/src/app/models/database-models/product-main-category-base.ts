import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ProductMainCategoryBase {

//#region productMainCategoryId Prop
        @prop()
        productMainCategoryId : number;
//#endregion productMainCategoryId Prop


//#region productMainCategoryName Prop
        @required()
        @maxLength({value:50})
        productMainCategoryName : string;
//#endregion productMainCategoryName Prop



}