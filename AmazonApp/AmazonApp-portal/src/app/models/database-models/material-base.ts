import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class MaterialBase {

//#region materialId Prop
        @prop()
        materialId : number;
//#endregion materialId Prop


//#region materialType Prop
        @required()
        @maxLength({value:20})
        materialType : string;
//#endregion materialType Prop



}