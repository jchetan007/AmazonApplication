import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class MusicCategoryBase {

//#region musicCategoryId Prop
        @prop()
        musicCategoryId : number;
//#endregion musicCategoryId Prop


//#region musicCategoryName Prop
        @required()
        @maxLength({value:20})
        musicCategoryName : string;
//#endregion musicCategoryName Prop

}