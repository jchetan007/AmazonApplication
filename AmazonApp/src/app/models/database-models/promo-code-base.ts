import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class PromoCodeBase {

//#region promoCodeId Prop
        @prop()
        promoCodeId : number;
//#endregion promoCodeId Prop


//#region promoCodeName Prop
        @required()
        @maxLength({value:50})
        promoCodeName : string;
//#endregion promoCodeName Prop


//#region amount Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        amount : number;
//#endregion amount Prop


//#region validFrom Prop
        @required()
        validFrom : any;
//#endregion validFrom Prop


//#region validTill Prop
        @required()
        validTill : any;
//#endregion validTill Prop



}