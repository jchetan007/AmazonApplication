import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class BankDetailBase {

//#region bankDetailId Prop
        @prop()
        bankDetailId : number;
//#endregion bankDetailId Prop


//#region accountHolderName Prop
        @required()
        @maxLength({value:50})
        accountHolderName : string;
//#endregion accountHolderName Prop


//#region accountType Prop
        @required()
        @maxLength({value:50})
        accountType : string;
//#endregion accountType Prop


//#region accountNumber Prop
        @required()
        @maxLength({value:20})
        accountNumber : string;
//#endregion accountNumber Prop


//#region balance Prop
        @prop()
        balance : any;
//#endregion balance Prop


//#region appUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        appUserId : number;
//#endregion appUserId Prop





}