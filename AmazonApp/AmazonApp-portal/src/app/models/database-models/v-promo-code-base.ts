import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vPromoCodeBase {

//#region promoCodeName Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'promoCodeName', keyColumn: false})
        promoCodeName : string;
//#endregion promoCodeName Prop


//#region amount Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'amount', keyColumn: true})
        amount : number;
//#endregion amount Prop


//#region cartItemId Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'cartItemId', keyColumn: false})
        cartItemId : number;
//#endregion cartItemId Prop

}