import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class CardBase {

//#region cardId Prop
        @prop()
        cardId : number;
//#endregion cardId Prop


//#region cardNumber Prop
        @required()
        @maxLength({value:20})
        cardNumber : string;
//#endregion cardNumber Prop


//#region cardType Prop
        @required()
        @maxLength({value:50})
        cardType : string;
//#endregion cardType Prop


//#region expiryDate Prop
        @required()
        @maxLength({value:50})
        expiryDate : string;
//#endregion expiryDate Prop


//#region cvv Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        cvv : number;
//#endregion cvv Prop


//#region appUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        appUserId : number;
//#endregion appUserId Prop



}