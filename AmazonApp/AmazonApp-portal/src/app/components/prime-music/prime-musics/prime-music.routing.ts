import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { PrimeMusicListComponent } from './list/prime-music-list.component';
import { PrimeMusicAddComponent } from './add/prime-music-add.component';
import { PrimeMusicEditComponent } from './edit/prime-music-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: PrimeMusicListComponent
    },
    {
        path: 'add',
        component: PrimeMusicAddComponent
    },
    {
        path: ':id',
        component:  PrimeMusicEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
