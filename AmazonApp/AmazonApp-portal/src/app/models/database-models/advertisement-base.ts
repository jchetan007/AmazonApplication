import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class AdvertisementBase {

//#region advertisementId Prop
        @prop()
        advertisementId : number;
//#endregion advertisementId Prop


//#region image Prop
        @prop()
        image : any;
//#endregion image Prop


//#region offerId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        offerId : number;
//#endregion offerId Prop


//#region applicationObjectId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        applicationObjectId : number;
//#endregion applicationObjectId Prop



}