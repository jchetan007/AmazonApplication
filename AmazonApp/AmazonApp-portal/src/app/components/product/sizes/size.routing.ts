import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { SizeListComponent } from './list/size-list.component';
import { SizeAddComponent } from './add/size-add.component';
import { SizeEditComponent } from './edit/size-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: SizeListComponent
    },
    {
        path: 'add',
        component: SizeAddComponent
    },
    {
        path: ':id',
        component:  SizeEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
