import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './user-address.routing'

import { UserAddressListComponent } from './list/user-address-list.component'
import { UserAddressEditComponent } from './edit/user-address-edit.component';
import { UserAddressAddComponent } from './add/user-address-add.component';
import { UserAddressSharedModule } from './user-address-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,UserAddressSharedModule,
        ROUTING
    ],
    declarations: [UserAddressListComponent,UserAddressEditComponent,UserAddressAddComponent],
    exports: [RouterModule],
    providers: []
})
export class UserAddressModule { }


