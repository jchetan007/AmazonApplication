import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class AppUserBase {

//#region appUserId Prop
        @prop()
        appUserId : number;
//#endregion appUserId Prop


//#region appUserName Prop
        @required()
        @maxLength({value:20})
        appUserName : string;
//#endregion appUserName Prop


//#region mobileNumber Prop
        @required()
        @maxLength({value:20})
        mobileNumber : string;
//#endregion mobileNumber Prop


//#region emailId Prop
        @required()
        @maxLength({value:50})
        emailId : string;
//#endregion emailId Prop


//#region password Prop
        @maxLength({value:50})
        password : any;
//#endregion password Prop


//#region createdDate Prop
        @required()
        createdDate : any;
//#endregion createdDate Prop


//#region roleId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        roleId : number;
//#endregion roleId Prop


//#region salt Prop
        @maxLength({value:50})
        salt : any;
//#endregion salt Prop

























}