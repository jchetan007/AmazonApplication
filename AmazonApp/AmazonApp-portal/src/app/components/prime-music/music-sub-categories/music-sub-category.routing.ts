import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MusicSubCategoryListComponent } from './list/music-sub-category-list.component';
import { MusicSubCategoryAddComponent } from './add/music-sub-category-add.component';
import { MusicSubCategoryEditComponent } from './edit/music-sub-category-edit.component';

const ROUTES: Routes = [
    {
        path: 'list/:id',
        component: MusicSubCategoryListComponent
    },
    {
        path: 'add',
        component: MusicSubCategoryAddComponent
    },
    {
        path: ':id',
        component:  MusicSubCategoryEditComponent
    },
];

export const ROUTING: ModuleWithProviders = RouterModule.forChild(ROUTES);
