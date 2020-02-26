import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class FeedBackBase {

//#region feedBackId Prop
        @prop()
        feedBackId : number;
//#endregion feedBackId Prop


//#region comment Prop
        @maxLength({value:50})
        comment : string;
//#endregion comment Prop


//#region image Prop
        @prop()
        image : any;
//#endregion image Prop


//#region ratings Prop
        @required()
        ratings : any;
//#endregion ratings Prop


//#region appUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        appUserId : number;
//#endregion appUserId Prop


//#region productId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        productId : number;
//#endregion productId Prop





}