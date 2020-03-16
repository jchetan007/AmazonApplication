import {RoleBase} from '../database-models/role-base';
import {UserRoleBase} from '../database-models/user-role-base';
import {AdminBase} from '../database-models/admin-base';
import {AppUserBase} from '../database-models/app-user-base';
import {SellerBase} from '../database-models/seller-base';
import {RolePermissionBase} from '../database-models/role-permission-base';
//Generated Imports
export class Role extends RoleBase 
{




//#region Generated Reference Properties
//#region userRoles Prop
userRoles : UserRoleBase[];
//#endregion userRoles Prop
//#region admins Prop
admins : AdminBase[];
//#endregion admins Prop
//#region appUsers Prop
appUsers : AppUserBase[];
//#endregion appUsers Prop
//#region sellers Prop
sellers : SellerBase[];
//#endregion sellers Prop
//#region rolePermissions Prop
rolePermissions : RolePermissionBase[];
//#endregion rolePermissions Prop

//#endregion Generated Reference Properties

























}