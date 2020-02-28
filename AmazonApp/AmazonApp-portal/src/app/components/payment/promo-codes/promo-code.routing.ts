import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { PromoCodeListComponent } from './list/promo-code-list.component';
import { PromoCodeAddComponent } from './add/promo-code-add.component';
import { PromoCodeEditComponent } from './edit/promo-code-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: PromoCodeListComponent
    },
    {
        path: 'add',
        component: PromoCodeAddComponent
    },
    {
        path: ':id',
        component:  PromoCodeEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
