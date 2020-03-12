import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MusicCategoryListComponent } from './list/music-category-list.component';
import { MusicCategoryAddComponent } from './add/music-category-add.component';
import { MusicCategoryEditComponent } from './edit/music-category-edit.component';

const ROUTES: Routes = [
    {
        path: 'list/:id',
        component: MusicCategoryListComponent
    },
    {
        path: 'add',
        component: MusicCategoryAddComponent
    },
    {
        path: ':id',
        component:  MusicCategoryEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
