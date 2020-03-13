import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './music.routing'

import { MusicListComponent } from './list/music-list.component'
import { MusicEditComponent } from './edit/music-edit.component';
import { MusicAddComponent } from './add/music-add.component';
import { MusicSharedModule } from './music-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,MusicSharedModule,
        ROUTING
    ],
    declarations: [MusicListComponent,MusicEditComponent,MusicAddComponent],
    exports: [RouterModule],
    providers: []
})
export class MusicModule { }


