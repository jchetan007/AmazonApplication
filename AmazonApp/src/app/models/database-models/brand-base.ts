import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class BrandBase {

//#region brandId Prop
        @prop()
        brandId : number;
//#endregion brandId Prop


//#region brandName Prop
        @required()
        @maxLength({value:20})
        brandName : string;
//#endregion brandName Prop



}