import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MaterialListComponent } from './list/material-list.component';
import { MaterialAddComponent } from './add/material-add.component';
import { MaterialEditComponent } from './edit/material-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: MaterialListComponent
    },
    {
        path: 'add',
        component: MaterialAddComponent
    },
    {
        path: ':id',
        component:  MaterialEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
