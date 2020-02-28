import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vAdvertisementBase {

//#region advertisementId Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'advertisementId', keyColumn: true})
        advertisementId : number;
//#endregion advertisementId Prop


//#region offerPercentage Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'offerPercentage', keyColumn: false})
        offerPercentage : number;
//#endregion offerPercentage Prop


//#region discountPrice Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'discountPrice', keyColumn: false})
        discountPrice : number;
//#endregion discountPrice Prop

}