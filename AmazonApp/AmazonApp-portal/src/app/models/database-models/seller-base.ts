import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class SellerBase {

//#region sellerId Prop
        @prop()
        sellerId : number;
//#endregion sellerId Prop


//#region productName Prop
        @required()
        @maxLength({value:50})
        productName : string;
//#endregion productName Prop


//#region originalProductPrice Prop
        @required()
        originalProductPrice : any;
//#endregion originalProductPrice Prop


//#region sellerDetailId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        sellerDetailId : number;
//#endregion sellerDetailId Prop


//#region applicationObjectId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        applicationObjectId : number;
//#endregion applicationObjectId Prop


//#region brandId Prop
        @prop()
        brandId : number;
//#endregion brandId Prop


//#region sizeId Prop
        @prop()
        sizeId : number;
//#endregion sizeId Prop


//#region materialId Prop
        @prop()
        materialId : number;
//#endregion materialId Prop


//#region colorId Prop
        @prop()
        colorId : number;
//#endregion colorId Prop


//#region languageId Prop
        @prop()
        languageId : number;
//#endregion languageId Prop


//#region roleId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        roleId : number;
//#endregion roleId Prop


//#region bankDetailId Prop
        @prop()
        bankDetailId : number;
//#endregion bankDetailId Prop


//#region discountProductPrice Prop
        @prop()
        discountProductPrice : any;
//#endregion discountProductPrice Prop



























}