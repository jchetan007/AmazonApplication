import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vColorBase {

//#region productName Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'productName', keyColumn: false})
        productName : string;
//#endregion productName Prop


//#region colorName Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'colorName', keyColumn: false})
        colorName : string;
//#endregion colorName Prop

}