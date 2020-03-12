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
    AppUserId:any;
    result: any;
    id: any;

    ngOnInit(): void {
        this.AppUserId = localStorage.getItem("AppUserId");
        this.get({path:'api/vCartItems',params:[1],queryParams:{AppUserId:this.AppUserId}}).subscribe((t: List<vCartItem>) => {
            console.log(t);    
              this.vCartItems = t;
      })
    }
  
    // Get() {
    //     this.subscription = this.get().subscribe((t: List<vCartItem>) => {
    //         this.vCartItems = t;
            
    //     })
        
    // }

    removeProduct(id:number)
    {
        this.delete({path:'api/CartItems', params:[1],queryParams:{ProductId:[id]}, body:{}}).subscribe(res => {
            this.result = res;
        })
        alert("Product Removed from Cart!!");
    }
}
