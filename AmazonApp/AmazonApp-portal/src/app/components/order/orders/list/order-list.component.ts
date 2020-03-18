import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractOrder } from '../domain/abstract-order';
import { vCartItem } from "@app/models";
import { Order } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-order-list",
    templateUrl:'./order-list.component.html'
})
export class OrderListComponent extends AbstractOrder implements OnInit, OnDestroy {
    orders: List<Order>;
    subscription: Subscription;
    vCartItems: List<vCartItem>;
    AppUserId:any;

    ngOnInit(): void {
        this.AppUserId=localStorage.getItem("AppUserId");
        this.get({path:'api/vCartItems',params:[1],queryParams:{AppUserId:this.AppUserId}}).subscribe((t: List<vCartItem>) => {
            console.log(t);    
              this.vCartItems = t;
        //this.subscription = this.get().subscribe((t: List<Order>) => {
         //   this.orders = t;
           // this.get();
        }) 
       }
    //     Get() {
    //         this.subscription = this.get().subscribe((t:List<Order>)=> {
    //             this.orders = t;
    //         })
                
    // }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}