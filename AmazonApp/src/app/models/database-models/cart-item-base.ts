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


//#region cartId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        cartId : number;
//#endregion cartId Prop


//#region productQuantity Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        productQuantity : number;
//#endregion productQuantity Prop


//#region totalPrice Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        totalPrice : number;
//#endregion totalPrice Prop


//#region cartQuantity Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        cartQuantity : number;
//#endregion cartQuantity Prop





}