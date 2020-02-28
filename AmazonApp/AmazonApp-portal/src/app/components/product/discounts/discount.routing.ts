import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DiscountListComponent } from './list/discount-list.component';
import { DiscountAddComponent } from './add/discount-add.component';
import { DiscountEditComponent } from './edit/discount-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: DiscountListComponent
    },
    {
        path: 'add',
        component: DiscountAddComponent
    },
    {
        path: ':id',
        component:  DiscountEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
