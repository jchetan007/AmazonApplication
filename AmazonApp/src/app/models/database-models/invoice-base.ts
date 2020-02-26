import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class InvoiceBase {

//#region invoiceId Prop
        @prop()
        invoiceId : number;
//#endregion invoiceId Prop


//#region paymentId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        paymentId : number;
//#endregion paymentId Prop


//#region invoiceDate Prop
        @required()
        invoiceDate : any;
//#endregion invoiceDate Prop



}