import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MusicListComponent } from './list/music-list.component';
import { MusicAddComponent } from './add/music-add.component';
import { MusicEditComponent } from './edit/music-edit.component';

const ROUTES: Routes = [
    {
        path: 'list/:id',
        component: MusicListComponent
    },
    {
        path: 'add',
        component: MusicAddComponent
    },
    {
        path: ':id',
        component:  MusicEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
