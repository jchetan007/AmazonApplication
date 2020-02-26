import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class MusicSubCategoryBase {

//#region musicSubCategoryId Prop
        @prop()
        musicSubCategoryId : number;
//#endregion musicSubCategoryId Prop


//#region primeMusicId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        primeMusicId : number;
//#endregion primeMusicId Prop


//#region categoryName Prop
        @required()
        @maxLength({value:50})
        categoryName : string;
//#endregion categoryName Prop


//#region applicationObjectId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        applicationObjectId : number;
//#endregion applicationObjectId Prop





}