import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './music-category.routing'

import { MusicCategoryListComponent } from './list/music-category-list.component'
import { MusicCategoryEditComponent } from './edit/music-category-edit.component';
import { MusicCategoryAddComponent } from './add/music-category-add.component';
import { MusicCategorySharedModule } from './music-category-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,MusicCategorySharedModule,
        ROUTING
    ],
    declarations: [MusicCategoryListComponent,MusicCategoryEditComponent,MusicCategoryAddComponent],
    exports: [RouterModule],
    providers: []
})
export class MusicCategoryModule { }


