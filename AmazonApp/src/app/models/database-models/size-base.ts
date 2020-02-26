import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class SizeBase {

//#region sizeId Prop
        @prop()
        sizeId : number;
//#endregion sizeId Prop


//#region sizeType Prop
        @required()
        @maxLength({value:20})
        sizeType : string;
//#endregion sizeType Prop



}