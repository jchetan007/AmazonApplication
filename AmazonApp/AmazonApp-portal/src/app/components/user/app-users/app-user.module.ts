import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './app-user.routing'

import { AppUserListComponent } from './list/app-user-list.component'
import { AppUserEditComponent } from './edit/app-user-edit.component';
import { AppUserAddComponent } from './add/app-user-add.component';
import { AppUserSharedModule } from './app-user-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,AppUserSharedModule,
        ROUTING
    ],
    declarations: [AppUserListComponent,AppUserEditComponent,AppUserAddComponent],
    exports: [RouterModule],
    providers: []
})
export class AppUserModule { }


