import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class MusicBase {

//#region musicId Prop
        @prop()
        musicId : number;
//#endregion musicId Prop


//#region musicName Prop
        @required()
        @maxLength({value:20})
        musicName : string;
//#endregion musicName Prop


//#region musicSubCategoryId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        musicSubCategoryId : number;
//#endregion musicSubCategoryId Prop


//#region albumName Prop
        @required()
        @maxLength({value:20})
        albumName : string;
//#endregion albumName Prop


//#region artistName Prop
        @required()
        @maxLength({value:20})
        artistName : string;
//#endregion artistName Prop



}