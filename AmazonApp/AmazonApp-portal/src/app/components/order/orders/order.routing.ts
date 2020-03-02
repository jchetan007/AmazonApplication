import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { OrderListComponent } from './list/order-list.component';
import { OrderAddComponent } from './add/order-add.component';
import { OrderEditComponent } from './edit/order-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: OrderListComponent
    },
    {
        path: 'add',
        component: OrderAddComponent
    },
    {
        path: ':id',
        component:  OrderEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
