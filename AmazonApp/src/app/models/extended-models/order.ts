import {OrderBase} from '../database-models/order-base';
import {AppUserBase} from '../database-models/app-user-base';
import {PromoCodeBase} from '../database-models/promo-code-base';
import {OrderDetailBase} from '../database-models/order-detail-base';
import {PaymentBase} from '../database-models/payment-base';
//Generated Imports
export class Order extends OrderBase 
{




//#region Generated Reference Properties
//#region appUser Prop
appUser : AppUserBase;
//#endregion appUser Prop
//#region promoCode Prop
promoCode : PromoCodeBase;
//#endregion promoCode Prop
//#region orderDetails Prop
orderDetails : OrderDetailBase[];
//#endregion orderDetails Prop
//#region payments Prop
payments : PaymentBase[];
//#endregion payments Prop

//#endregion Generated Reference Properties













}