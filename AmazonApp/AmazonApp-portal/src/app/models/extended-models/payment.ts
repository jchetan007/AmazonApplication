import {PaymentBase} from '../database-models/payment-base';
import {AppUserBase} from '../database-models/app-user-base';
import {PromoCodeBase} from '../database-models/promo-code-base';
import {InvoiceBase} from '../database-models/invoice-base';
import {OrderBase} from '../database-models/order-base';
//Generated Imports
export class Payment extends PaymentBase 
{




//#region Generated Reference Properties
//#region appUser Prop
appUser : AppUserBase;
//#endregion appUser Prop
//#region promoCode Prop
promoCode : PromoCodeBase;
//#endregion promoCode Prop
//#region invoices Prop
invoices : InvoiceBase[];
//#endregion invoices Prop
//#region orders Prop
orders : OrderBase[];
//#endregion orders Prop

//#endregion Generated Reference Properties






















}