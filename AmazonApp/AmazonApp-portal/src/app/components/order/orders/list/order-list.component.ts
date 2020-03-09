import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractOrder } from '../domain/abstract-order';
import { Order } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-order-list",
    templateUrl:'./order-list.component.html'
})
export class OrderListComponent extends AbstractOrder implements OnInit, OnDestroy {
    orders: List<Order>;
    subscription: Subscription;

    ngOnInit(): void {
        //this.subscription = this.get().subscribe((t: List<Order>) => {
         //   this.orders = t;
            this.get();
            
        }
        Get() {
            this.subscription = this.get().subscribe((t:List<Order>)=> {
                this.orders = t;
            })
                
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
