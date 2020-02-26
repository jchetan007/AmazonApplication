import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vCartItemBase {

//#region productName Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'productName', keyColumn: false})
        productName : string;
//#endregion productName Prop


//#region productPrice Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'productPrice', keyColumn: false})
        productPrice : any;
//#endregion productPrice Prop


//#region productQuantity Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'productQuantity', keyColumn: true})
        productQuantity : number;
//#endregion productQuantity Prop


//#region cartValue Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'cartValue', keyColumn: false})
        cartValue : number;
//#endregion cartValue Prop

}