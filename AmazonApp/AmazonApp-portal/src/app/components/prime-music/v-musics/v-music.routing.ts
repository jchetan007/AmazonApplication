import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { vMusicListComponent } from './list/v-music-list.component';
import { vMusicAddComponent } from './add/v-music-add.component';
import { vMusicEditComponent } from './edit/v-music-edit.component';

const ROUTES: Routes = [
    {
        path: '',
        component: vMusicListComponent
    },
    {
        path: 'add',
        component: vMusicAddComponent
    },
    {
        path: ':id',
        component:  vMusicEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
