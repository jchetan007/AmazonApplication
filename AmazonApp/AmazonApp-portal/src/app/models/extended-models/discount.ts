import {DiscountBase} from '../database-models/discount-base';
import {ProductCategoryBase} from '../database-models/product-category-base';
import {SellerBase} from '../database-models/seller-base';
import {OfferBase} from '../database-models/offer-base';
//Generated Imports
export class Discount extends DiscountBase 
{




//#region Generated Reference Properties
//#region productCategory Prop
        productCategory : ProductCategoryBase;
//#endregion productCategory Prop

//#region seller Prop
        seller : SellerBase;
//#endregion seller Prop

//#region offers Prop
        offers : OfferBase[];
//#endregion offers Prop

//#endregion Generated Reference Properties
}