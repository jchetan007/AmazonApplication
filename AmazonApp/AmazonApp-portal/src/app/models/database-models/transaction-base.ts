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


//#region sellerId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        sellerId : number;
//#endregion sellerId Prop


//#region amount Prop
        @required()
        amount : any;
//#endregion amount Prop


//#region applicationObjectId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        applicationObjectId : number;
//#endregion applicationObjectId Prop


//#region transactionDate Prop
        @required()
        transactionDate : Date;
//#endregion transactionDate Prop





}