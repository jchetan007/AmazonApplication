import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vDiscountBase {

//#region discountPrice Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'discountPrice', keyColumn: true})
        discountPrice : number;
//#endregion discountPrice Prop


//#region productCategoryId Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'productCategoryId', keyColumn: false})
        productCategoryId : number;
//#endregion productCategoryId Prop


//#region productPrice Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'productPrice', keyColumn: false})
        productPrice : any;
//#endregion productPrice Prop

}