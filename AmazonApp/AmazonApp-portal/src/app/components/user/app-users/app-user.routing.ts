import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AppUserListComponent } from './list/app-user-list.component';
import { AppUserAddComponent } from './add/app-user-add.component';
import { AppUserEditComponent } from './edit/app-user-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: AppUserListComponent
    },
    {
        path: 'add',
        component: AppUserAddComponent
    },
    {
        path: ':id',
        component:  AppUserEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
