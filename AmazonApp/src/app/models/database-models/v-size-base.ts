import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vSizeBase {

//#region productName Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'productName', keyColumn: false})
        productName : string;
//#endregion productName Prop


//#region sizeType Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'sizeType', keyColumn: false})
        sizeType : string;
//#endregion sizeType Prop

}