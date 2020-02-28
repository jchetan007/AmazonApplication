import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ColorListComponent } from './list/color-list.component';
import { ColorAddComponent } from './add/color-add.component';
import { ColorEditComponent } from './edit/color-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: ColorListComponent
    },
    {
        path: 'add',
        component: ColorAddComponent
    },
    {
        path: ':id',
        component:  ColorEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
