import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class ColorBase {

//#region colorId Prop
        @prop()
        colorId : number;
//#endregion colorId Prop


//#region colorName Prop
        @required()
        @maxLength({value:20})
        colorName : string;
//#endregion colorName Prop



}