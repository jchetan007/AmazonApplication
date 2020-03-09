import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './card.routing'

import { CardListComponent } from './list/card-list.component'
import { CardEditComponent } from './edit/card-edit.component';
import { CardAddComponent } from './add/card-add.component';
import { CardSharedModule } from './card-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,CardSharedModule,
        ROUTING
    ],
    declarations: [CardListComponent,CardEditComponent,CardAddComponent],
    exports: [RouterModule],
    providers: []
})
export class CardModule { }


