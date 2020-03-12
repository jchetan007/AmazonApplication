import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ProductCategoryListComponent } from './list/product-category-list.component';
import { ProductCategoryAddComponent } from './add/product-category-add.component';
import { ProductCategoryEditComponent } from './edit/product-category-edit.component';

const ROUTES: Routes = [
    {
        path: 'list/:id',
        component: ProductCategoryListComponent
    },
    {
        path: 'add',
        component: ProductCategoryAddComponent
    },
    {
        path: ':id',
        component:  ProductCategoryEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
