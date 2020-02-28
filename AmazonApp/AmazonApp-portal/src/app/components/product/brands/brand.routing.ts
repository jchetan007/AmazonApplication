import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { BrandListComponent } from './list/brand-list.component';
import { BrandAddComponent } from './add/brand-add.component';
import { BrandEditComponent } from './edit/brand-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: BrandListComponent
    },
    {
        path: 'add',
        component: BrandAddComponent
    },
    {
        path: ':id',
        component:  BrandEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
