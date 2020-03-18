import { Component, OnInit } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractvCartItem } from '../domain/abstract-v-cart-item';
import { vCartItem } from "@app/models";
import { Subscription } from 'rxjs';
import { anonymous } from '@rxweb/angular-router'
import { AnonymousSubject } from 'rxjs/internal/Subject';
import { Router } from '@angular/router';
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
    CartValue: any;
    CartQuantity: any;
    isCartEmpty: boolean = false;
    isCart: boolean = false;
    
    constructor( private router: Router) {super();}

    ngOnInit(): void {
       // localStorage.setItem("CartValue", JSON.stringify(this.vCartItems));
        this.AppUserId = localStorage.getItem("AppUserId");
        this.get({path:'api/vCartItems',params:[1],queryParams:{AppUserId:this.AppUserId}}).subscribe((t: List<vCartItem>) => {
            console.log(t);    
              this.vCartItems = t;
              localStorage.setItem("CartValue",this.vCartItems[0].cartValue);
              localStorage.setItem("CartQuantity",this.vCartItems[0].cartQuantity);
              //console.log(localStorage.getItem("CartValue"));
              this.CartValue=localStorage.getItem("CartValue");
              this.CartQuantity=localStorage.getItem("CartQuantity");

              if(this.id===null)
              {
                  this.isCartEmpty=true;
                  this.isCart=false;
                  console.log("Cart Empty");
              }
              else
              {
                this.isCart=true;
                this.isCartEmpty=false;
                
  
              }


      })
    }
  
    // Get() {
    //     this.subscription = this.get().subscribe((t: List<vCartItem>) => {
    //         this.vCartItems = t;
            
    //     })
        
    // }

    removeProduct(id:number)
    {
        this.get({path:'api/CartItems', params:[1],queryParams:{ProductId:[id]}}).subscribe(res => {
            this.result = res;
        })
        alert("Product Removed from Cart!!");
        window.location.reload()
        
    }

    proceedToBuy()
    {
        // this.isCart=true;
        this.isCartEmpty=false;
        this.router.navigateByUrl('/transactions/add')
    }

    // clearCart()
    // {
    //     this.delete({path:'api/vCartItems', params:[1],queryParams:{AppUserId:[this.AppUserId]}, body:{}}).subscribe(res => {
    //         this.result = res;
    //     })
    //     localStorage.removeItem('CartValue');
    //     localStorage.removeItem('CartQuantity');
    //     alert("All Product Removed from Cart!!");
    //     this.isCartEmpty=true;
    //     this.isCart=false;
    //     console.log("Cart Empty");
    //     //window.location.reload();
    // }
}
