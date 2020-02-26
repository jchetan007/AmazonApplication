import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class CartBase {

//#region cartId Prop
        @prop()
        cartId : number;
//#endregion cartId Prop


//#region quantity Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        quantity : number;
//#endregion quantity Prop


//#region cartValue Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        cartValue : number;
//#endregion cartValue Prop


//#region appUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        appUserId : number;
//#endregion appUserId Prop







}