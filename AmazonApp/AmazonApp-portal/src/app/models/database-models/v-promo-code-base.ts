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


//#region cartValue Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'cartValue', keyColumn: false})
        cartValue : number;
//#endregion cartValue Prop


//#region cartId Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'cartId', keyColumn: false})
        cartId : number;
//#endregion cartId Prop

}