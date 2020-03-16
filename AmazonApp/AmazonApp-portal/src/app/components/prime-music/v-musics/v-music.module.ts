import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './v-music.routing'

import { vMusicListComponent } from './list/v-music-list.component'
import { vMusicEditComponent } from './edit/v-music-edit.component';
import { vMusicAddComponent } from './add/v-music-add.component';
import { vMusicSharedModule } from './v-music-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,vMusicSharedModule,
        ROUTING
    ],
    declarations: [vMusicListComponent,vMusicEditComponent,vMusicAddComponent],
    exports: [RouterModule],
    providers: []
})
export class vMusicModule { }


