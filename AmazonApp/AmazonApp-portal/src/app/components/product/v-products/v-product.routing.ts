import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { vProductListComponent } from './list/v-product-list.component';
import { vProductAddComponent } from './add/v-product-add.component';
import { vProductEditComponent } from './edit/v-product-edit.component';

const ROUTES: Routes = [
    {
        path: 'list/:id',
        component: vProductListComponent
    },
    {
        path: 'add',
        component: vProductAddComponent
    },
    {
        path: ':id',
        component:  vProductEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
