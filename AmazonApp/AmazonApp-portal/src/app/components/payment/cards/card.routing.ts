import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CardListComponent } from './list/card-list.component';
import { CardAddComponent } from './add/card-add.component';
import { CardEditComponent } from './edit/card-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: CardListComponent
    },
    {
        path: 'add',
        component: CardAddComponent
    },
    {
        path: ':id',
        component:  CardEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
