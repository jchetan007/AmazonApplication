import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ProductMainCategoryListComponent } from './list/product-main-category-list.component';
import { ProductMainCategoryAddComponent } from './add/product-main-category-add.component';
import { ProductMainCategoryEditComponent } from './edit/product-main-category-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: ProductMainCategoryListComponent
    },
    {
        path: 'add',
        component: ProductMainCategoryAddComponent
    },
    {
        path: ':id',
        component:  ProductMainCategoryEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
