import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { BuyNowTransactionListComponent } from './list/buy-now-transaction-list.component';
import { BuyNowTransactionAddComponent } from './add/buy-now-transaction-add.component';
import { BuyNowTransactionEditComponent } from './edit/buy-now-transaction-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: BuyNowTransactionListComponent
    },
    {
        path: 'add',
        component: BuyNowTransactionAddComponent
    },
    {
        path: ':id',
        component:  BuyNowTransactionEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
