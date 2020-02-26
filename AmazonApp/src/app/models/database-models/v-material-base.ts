import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vMaterialBase {

//#region productName Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'productName', keyColumn: false})
        productName : string;
//#endregion productName Prop


//#region materialType Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'materialType', keyColumn: false})
        materialType : string;
//#endregion materialType Prop

}