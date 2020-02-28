import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class StoreBase {

//#region storeId Prop
        @prop()
        storeId : number;
//#endregion storeId Prop


//#region storeName Prop
        @required()
        @maxLength({value:50})
        storeName : string;
//#endregion storeName Prop


//#region taxDetails Prop
        @required()
        @maxLength({value:50})
        taxDetails : string;
//#endregion taxDetails Prop


//#region gst Prop
        @required()
        @maxLength({value:50})
        gst : string;
//#endregion gst Prop


//#region signature Prop
        @prop()
        signature : any;
//#endregion signature Prop


//#region createdDate Prop
        @required()
        createdDate : any;
//#endregion createdDate Prop



}