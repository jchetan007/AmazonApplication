import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { VerifyPromoCodeListComponent } from './list/verify-promo-code-list.component';
import { VerifyPromoCodeAddComponent } from './add/verify-promo-code-add.component';
import { VerifyPromoCodeEditComponent } from './edit/verify-promo-code-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: VerifyPromoCodeListComponent
    },
    {
        path: 'add',
        component: VerifyPromoCodeAddComponent
    },
    {
        path: ':id',
        component:  VerifyPromoCodeEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
