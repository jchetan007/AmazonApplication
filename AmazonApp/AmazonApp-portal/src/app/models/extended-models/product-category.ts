import {ProductCategoryBase} from '../database-models/product-category-base';
import {ProductMainCategoryBase} from '../database-models/product-main-category-base';
import {StoreBase} from '../database-models/store-base';
import {ProductSubCategoryBase} from '../database-models/product-sub-category-base';
import {DiscountBase} from '../database-models/discount-base';
//Generated Imports
export class ProductCategory extends ProductCategoryBase 
{




//#region Generated Reference Properties

//#region productMainCategory Prop
        productMainCategory : ProductMainCategoryBase;
//#endregion productMainCategory Prop
//#region store Prop
store : StoreBase;
//#endregion store Prop
//#region productSubCategories Prop
productSubCategories : ProductSubCategoryBase[];
//#endregion productSubCategories Prop
//#region discounts Prop
discounts : DiscountBase[];
//#endregion discounts Prop

//#endregion Generated Reference Properties















}