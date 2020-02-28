import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { LanguageListComponent } from './list/language-list.component';
import { LanguageAddComponent } from './add/language-add.component';
import { LanguageEditComponent } from './edit/language-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: LanguageListComponent
    },
    {
        path: 'add',
        component: LanguageAddComponent
    },
    {
        path: ':id',
        component:  LanguageEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
