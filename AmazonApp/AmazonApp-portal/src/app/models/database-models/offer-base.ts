import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class OfferBase {

//#region offerId Prop
        @prop()
        offerId : number;
//#endregion offerId Prop


//#region productId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        productId : number;
//#endregion productId Prop


//#region offerPercentage Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        offerPercentage : number;
//#endregion offerPercentage Prop


//#region discountId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        discountId : number;
//#endregion discountId Prop







}