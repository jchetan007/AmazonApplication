import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { VerifyLoginListComponent } from './list/verify-login-list.component';
import { VerifyLoginAddComponent } from './add/verify-login-add.component';
import { VerifyLoginEditComponent } from './edit/verify-login-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: VerifyLoginListComponent
    },
    {
        path: 'add',
        component: VerifyLoginAddComponent
    },
    {
        path: ':id',
        component:  VerifyLoginEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
