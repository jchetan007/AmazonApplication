import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { SellerListComponent } from './list/seller-list.component';
import { SellerAddComponent } from './add/seller-add.component';
import { SellerEditComponent } from './edit/seller-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: SellerListComponent
    },
    {
        path: 'add',
        component: SellerAddComponent
    },
    {
        path: ':id',
        component:  SellerEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
