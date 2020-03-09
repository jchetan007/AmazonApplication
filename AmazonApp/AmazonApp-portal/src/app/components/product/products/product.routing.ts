import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ProductListComponent } from './list/product-list.component';
import { ProductAddComponent } from './add/product-add.component';
import { ProductEditComponent } from './edit/product-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: ProductListComponent
    },
    {
        path: 'add',
        component: ProductAddComponent
    },
    {
        path: ':id',
        component:  ProductEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
