import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vProductCategoryLookupBase {

//#region productCategoryName Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'productCategoryName', keyColumn: false})
        productCategoryName : string;
//#endregion productCategoryName Prop

}