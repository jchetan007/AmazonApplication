import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './music-sub-category.routing'

import { MusicSubCategoryListComponent } from './list/music-sub-category-list.component'
import { MusicSubCategoryEditComponent } from './edit/music-sub-category-edit.component';
import { MusicSubCategoryAddComponent } from './add/music-sub-category-add.component';
import { MusicSubCategorySharedModule } from './music-sub-category-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,MusicSubCategorySharedModule,
        ROUTING
    ],
    declarations: [MusicSubCategoryListComponent,MusicSubCategoryEditComponent,MusicSubCategoryAddComponent],
    exports: [RouterModule],
    providers: []
})
export class MusicSubCategoryModule { }


