import {AppUserBase} from '../database-models/app-user-base';
import {RoleBase} from '../database-models/role-base';
import {PrimeMusicBase} from '../database-models/prime-music-base';
import {SellerBase} from '../database-models/seller-base';
import {TransactionBase} from '../database-models/transaction-base';
import {CartItemBase} from '../database-models/cart-item-base';
import {BankDetailBase} from '../database-models/bank-detail-base';
import {OrderBase} from '../database-models/order-base';
import {CardBase} from '../database-models/card-base';
import {UserAddressBase} from '../database-models/user-address-base';
import {FeedBackBase} from '../database-models/feed-back-base';
//Generated Imports
export class AppUser extends AppUserBase 
{




//#region Generated Reference Properties
//#region role Prop
role : RoleBase;

userPassword : any;
//#endregion role Prop
//#region primeMusics Prop
primeMusics : PrimeMusicBase[];
//#endregion primeMusics Prop
//#region sellers Prop
sellers : SellerBase[];
//#endregion sellers Prop
//#region transactions Prop
transactions : TransactionBase[];
//#endregion transactions Prop
//#region cartItems Prop
cartItems : CartItemBase[];
//#endregion cartItems Prop
//#region bankDetails Prop
bankDetails : BankDetailBase[];
//#endregion bankDetails Prop
//#region orders Prop
orders : OrderBase[];
//#endregion orders Prop
//#region cards Prop
cards : CardBase[];
//#endregion cards Prop
//#region userAddresses Prop
userAddresses : UserAddressBase[];
//#endregion userAddresses Prop
//#region feedBacks Prop
feedBacks : FeedBackBase[];
//#endregion feedBacks Prop

//#endregion Generated Reference Properties















}