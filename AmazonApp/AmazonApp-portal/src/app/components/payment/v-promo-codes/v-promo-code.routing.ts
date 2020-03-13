import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { vPromoCodeListComponent } from './list/v-promo-code-list.component';
import { vPromoCodeAddComponent } from './add/v-promo-code-add.component';
import { vPromoCodeEditComponent } from './edit/v-promo-code-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: vPromoCodeListComponent
    },
    {
        path: 'add',
        component: vPromoCodeAddComponent
    },
    {
        path: ':id',
        component:  vPromoCodeEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
