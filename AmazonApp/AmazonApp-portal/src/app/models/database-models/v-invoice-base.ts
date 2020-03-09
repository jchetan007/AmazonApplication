import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vInvoiceBase {

//#region invoiceId Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'invoiceId', keyColumn: true})
        invoiceId : number;
//#endregion invoiceId Prop


//#region invoiceDate Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'invoiceDate', keyColumn: false})
        invoiceDate : any;
//#endregion invoiceDate Prop


//#region appUserName Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'appUserName', keyColumn: false})
        appUserName : string;
//#endregion appUserName Prop


//#region companyName Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'companyName', keyColumn: false})
        companyName : string;
//#endregion companyName Prop


//#region productName Prop
        @gridColumn({visible: true, columnIndex:4, allowSorting: true, headerKey: 'productName', keyColumn: false})
        productName : string;
//#endregion productName Prop


//#region originalProductPrice Prop
        @gridColumn({visible: true, columnIndex:5, allowSorting: true, headerKey: 'originalProductPrice', keyColumn: false})
        originalProductPrice : any;
//#endregion originalProductPrice Prop


//#region discountProductPrice Prop
        @gridColumn({visible: true, columnIndex:6, allowSorting: true, headerKey: 'discountProductPrice', keyColumn: false})
        discountProductPrice : any;
//#endregion discountProductPrice Prop


//#region productQuantity Prop
        @gridColumn({visible: true, columnIndex:5, allowSorting: true, headerKey: 'productQuantity', keyColumn: false})
        productQuantity : number;
//#endregion productQuantity Prop


//#region createdDate Prop
        @gridColumn({visible: true, columnIndex:7, allowSorting: true, headerKey: 'createdDate', keyColumn: false})
        createdDate : any;
//#endregion createdDate Prop


//#region cartValue Prop
        @gridColumn({visible: true, columnIndex:8, allowSorting: true, headerKey: 'cartValue', keyColumn: false})
        cartValue : any;
//#endregion cartValue Prop

}