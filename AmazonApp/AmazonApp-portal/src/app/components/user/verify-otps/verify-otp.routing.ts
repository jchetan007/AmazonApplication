import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { VerifyOtpListComponent } from './list/verify-otp-list.component';
import { VerifyOtpAddComponent } from './add/verify-otp-add.component';
import { VerifyOtpEditComponent } from './edit/verify-otp-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: VerifyOtpListComponent
    },
    {
        path: 'add',
        component: VerifyOtpAddComponent
    },
    {
        path: ':id',
        component:  VerifyOtpEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
