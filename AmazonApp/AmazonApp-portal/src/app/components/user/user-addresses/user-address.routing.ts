import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { UserAddressListComponent } from './list/user-address-list.component';
import { UserAddressAddComponent } from './add/user-address-add.component';
import { UserAddressEditComponent } from './edit/user-address-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: UserAddressListComponent
    },
    {
        path: 'add',
        component: UserAddressAddComponent
    },
    {
        path: ':id',
        component:  UserAddressEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
