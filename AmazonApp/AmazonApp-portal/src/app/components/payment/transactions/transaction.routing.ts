import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { TransactionListComponent } from './list/transaction-list.component';
import { TransactionAddComponent } from './add/transaction-add.component';
import { TransactionEditComponent } from './edit/transaction-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: TransactionListComponent
    },
    {
        path: 'add',
        component: TransactionAddComponent
    },
    {
        path: ':id',
        component:  TransactionEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
