import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './prime-music.routing'

import { PrimeMusicListComponent } from './list/prime-music-list.component'
import { PrimeMusicEditComponent } from './edit/prime-music-edit.component';
import { PrimeMusicAddComponent } from './add/prime-music-add.component';
import { PrimeMusicSharedModule } from './prime-music-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,PrimeMusicSharedModule,
        ROUTING
    ],
    declarations: [PrimeMusicListComponent,PrimeMusicEditComponent,PrimeMusicAddComponent],
    exports: [RouterModule],
    providers: []
})
export class PrimeMusicModule { }


