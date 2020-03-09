import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ProductSubCategoryListComponent } from './list/product-sub-category-list.component';
import { ProductSubCategoryAddComponent } from './add/product-sub-category-add.component';
import { ProductSubCategoryEditComponent } from './edit/product-sub-category-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: ProductSubCategoryListComponent
    },
    {
        path: 'add',
        component: ProductSubCategoryAddComponent
    },
    {
        path: ':id',
        component:  ProductSubCategoryEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
