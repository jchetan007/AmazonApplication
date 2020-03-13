import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class CartItemBase {

//#region cartItemId Prop
        @prop()
        cartItemId : number;
//#endregion cartItemId Prop


//#region productId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        productId : number;
//#endregion productId Prop


//#region productQuantity Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        productQuantity : number;
//#endregion productQuantity Prop


//#region totalPrice Prop
        @prop()
        totalPrice : number;
//#endregion totalPrice Prop


//#region cartQuantity Prop
        @prop()
        cartQuantity : number;
//#endregion cartQuantity Prop


//#region cartValue Prop
        @prop()
        cartValue : number;
//#endregion cartValue Prop


//#region appUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        appUserId : number;
//#endregion appUserId Prop





}