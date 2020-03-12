import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vProductBase {

//#region productId Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'productId', keyColumn: true})
        productId : number;
//#endregion productId Prop


//#region productName Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'productName', keyColumn: false})
        productName : string;
//#endregion productName Prop


//#region originalProductPrice Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'originalProductPrice', keyColumn: false})
        originalProductPrice : any;
//#endregion originalProductPrice Prop


//#region discountProductPrice Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'discountProductPrice', keyColumn: false})
        discountProductPrice : any;
//#endregion discountProductPrice Prop


//#region appUserId Prop
        @gridColumn({visible: true, columnIndex:4, allowSorting: true, headerKey: 'appUserId', keyColumn: false})
        appUserId : number;
//#endregion appUserId Prop


//#region productSubCategoryId Prop
        @gridColumn({visible: true, columnIndex:5, allowSorting: true, headerKey: 'productSubCategoryId', keyColumn: false})
        productSubCategoryId : number;
//#endregion productSubCategoryId Prop

}