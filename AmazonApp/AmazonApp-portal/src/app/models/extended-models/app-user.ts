import {AppUserBase} from '../database-models/app-user-base';
import {RoleBase} from '../database-models/role-base';
import {TransactionBase} from '../database-models/transaction-base';
import {CartBase} from '../database-models/cart-base';
import {BankDetailBase} from '../database-models/bank-detail-base';
import {SellerDetailBase} from '../database-models/seller-detail-base';
import {OrderBase} from '../database-models/order-base';
import {CardBase} from '../database-models/card-base';
import {FeedBackBase} from '../database-models/feed-back-base';
import {SellerBase} from '../database-models/seller-base';
import {OtpBase} from '../database-models/otp-base';
import {PrimeMusicBase} from '../database-models/prime-music-base';
import {UserAddressBase} from '../database-models/user-address-base';
//Generated Imports
export class AppUser extends AppUserBase 
{




//#region Generated Reference Properties
//#region role Prop
        role : RoleBase;
//#endregion role Prop

//#region transactions Prop
        transactions : TransactionBase[];
//#endregion transactions Prop

//#region carts Prop
        carts : CartBase[];
//#endregion carts Prop

//#region bankDetails Prop
        bankDetails : BankDetailBase[];
//#endregion bankDetails Prop

//#region sellerDetails Prop
        sellerDetails : SellerDetailBase[];
//#endregion sellerDetails Prop

//#region orders Prop
        orders : OrderBase[];
//#endregion orders Prop

//#region cards Prop
        cards : CardBase[];
//#endregion cards Prop

//#region feedBacks Prop
        feedBacks : FeedBackBase[];
//#endregion feedBacks Prop

//#region sellers Prop
        sellers : SellerBase[];
//#endregion sellers Prop

//#region otps Prop
        otps : OtpBase[];
//#endregion otps Prop

//#region primeMusics Prop
        primeMusics : PrimeMusicBase[];
//#endregion primeMusics Prop

//#region userAddresses Prop
        userAddresses : UserAddressBase[];
//#endregion userAddresses Prop

//#endregion Generated Reference Properties
}