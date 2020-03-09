import { Component, OnInit } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractvCartItem } from '../domain/abstract-v-cart-item';
import { vCartItem } from "@app/models";
import { Subscription } from 'rxjs';
import { anonymous } from '@rxweb/angular-router'
@anonymous()
@Component({
    selector:"app-v-cart-item-list",
    templateUrl:'./v-cart-item-list.component.html'
})
export class vCartItemListComponent extends AbstractvCartItem implements OnInit {
    vCartItems: List<vCartItem>;
    subscription: Subscription;
    // result: any

    ngOnInit(): void {
        this.get();
      }
  
    Get() {
        this.subscription = this.get().subscribe((t: List<vCartItem>) => {
            this.vCartItems = t;
            
        })
        console.log(this.vCartItems);
    }
}
