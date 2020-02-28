import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { vCartItemListComponent } from './list/v-cart-item-list.component';
import { vCartItemAddComponent } from './add/v-cart-item-add.component';
import { vCartItemEditComponent } from './edit/v-cart-item-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: vCartItemListComponent
    },
    {
        path: 'add',
        component: vCartItemAddComponent
    },
    {
        path: ':id',
        component:  vCartItemEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
