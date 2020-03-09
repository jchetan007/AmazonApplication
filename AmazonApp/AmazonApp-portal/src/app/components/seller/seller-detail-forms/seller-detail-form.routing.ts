import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { SellerDetailFormListComponent } from './list/seller-detail-form-list.component';
import { SellerDetailFormAddComponent } from './add/seller-detail-form-add.component';
import { SellerDetailFormEditComponent } from './edit/seller-detail-form-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: SellerDetailFormListComponent
    },
    {
        path: 'add',
        component: SellerDetailFormAddComponent
    },
    {
        path: ':id',
        component:  SellerDetailFormEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
