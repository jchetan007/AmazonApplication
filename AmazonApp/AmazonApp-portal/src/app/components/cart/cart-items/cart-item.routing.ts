import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CartItemListComponent } from './list/cart-item-list.component';
import { CartItemAddComponent } from './add/cart-item-add.component';
import { CartItemEditComponent } from './edit/cart-item-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: CartItemListComponent
    },
    {
        path: 'add',
        component: CartItemAddComponent
    },
    {
        path: ':id',
        component:  CartItemEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
