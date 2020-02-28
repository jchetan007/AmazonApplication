import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vCartItemBase {

//#region sellerId Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'sellerId', keyColumn: true})
        sellerId : number;
//#endregion sellerId Prop


//#region cartItemId Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'cartItemId', keyColumn: false})
        cartItemId : number;
//#endregion cartItemId Prop


//#region productName Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'productName', keyColumn: false})
        productName : string;
//#endregion productName Prop


//#region originalProductPrice Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'originalProductPrice', keyColumn: false})
        originalProductPrice : any;
//#endregion originalProductPrice Prop


//#region discountProductPrice Prop
        @gridColumn({visible: true, columnIndex:4, allowSorting: true, headerKey: 'discountProductPrice', keyColumn: false})
        discountProductPrice : any;
//#endregion discountProductPrice Prop


//#region productQuantity Prop
        @gridColumn({visible: true, columnIndex:5, allowSorting: true, headerKey: 'productQuantity', keyColumn: false})
        productQuantity : number;
//#endregion productQuantity Prop


//#region totalPrice Prop
        @gridColumn({visible: true, columnIndex:6, allowSorting: true, headerKey: 'totalPrice', keyColumn: false})
        totalPrice : number;
//#endregion totalPrice Prop


//#region cartValue Prop
        @gridColumn({visible: true, columnIndex:7, allowSorting: true, headerKey: 'cartValue', keyColumn: false})
        cartValue : number;
//#endregion cartValue Prop


//#region cartQuantity Prop
        @gridColumn({visible: true, columnIndex:8, allowSorting: true, headerKey: 'cartQuantity', keyColumn: false})
        cartQuantity : number;
//#endregion cartQuantity Prop


//#region productId Prop
        @gridColumn({visible: true, columnIndex:9, allowSorting: true, headerKey: 'productId', keyColumn: false})
        productId : number;
//#endregion productId Prop

}