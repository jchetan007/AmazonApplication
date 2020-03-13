import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class TransactionBase {

//#region transactionId Prop
        @prop()
        transactionId : number;
//#endregion transactionId Prop


//#region appUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        appUserId : number;
//#endregion appUserId Prop


//#region sellerDetailId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        sellerDetailId : number;
//#endregion sellerDetailId Prop


//#region amount Prop
        @required()
        amount : any;
//#endregion amount Prop


//#region transactionDate Prop
        @required()
        transactionDate : Date;
//#endregion transactionDate Prop







}