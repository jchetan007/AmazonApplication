import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractvProduct } from '../domain/abstract-v-product';
import { vProduct } from "@app/models";
import { Subscription } from 'rxjs';
import { anonymous } from '@rxweb/angular-router';
import { RxFormBuilder } from '@rxweb/reactive-form-validators';
import { ActivatedRoute, Router } from '@angular/router';
@anonymous()
@Component({
    selector:"app-v-product-list",
    templateUrl:'./v-product-list.component.html'
})
export class vProductListComponent extends AbstractvProduct implements OnInit, OnDestroy {
    vProducts: List<vProduct>;
    subscription: Subscription;
    id:any;
    value=0;
    AppUserId: any;
    vCartItem: any;
    result: any;
    Password: any;

    constructor(private formBuilder: RxFormBuilder, private activatedRoute: ActivatedRoute, private router:Router) {
        super();
        this.activatedRoute.params.subscribe(t => {
            this.id = t['id'];
        })
        
    }

    ngOnInit(): void {
        this.AppUserId = localStorage.getItem("AppUserId");
        this.Password = localStorage.getItem("Password");
        this.get({params:[this.id],queryParams:{ProductId:this.id}}).subscribe((t: List<vProduct>) => {
            console.log(t);    
              this.vProducts = t;
              //console.log(this.vProducts)
          })
         // if(this.vProducts == null) {
         //     console.log('true')
         //     this.showData = false;
         // }else{
         //     console.log('flase')
         //     this.showData = true;
         // }
        //  this.cartForm=this.formBuilder.group({
        //      productQuantity:[""]
        // });
         console.log(this.id); 
       
        this.get();
      }

      increaseValue()
      {
          this.value = isNaN(this.value) ? 1 : this.value;
          this.value++;
      }

      decreaseValue()
      {
          this.value = isNaN(this.value) ? 1 : this.value;
          this.value < 1 ? this.value = 1 : '';
          this.value--;
      }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

    // Get() {
    //     this.subscription = this.get().subscribe((t: List<vProduct>) => {
    //         this.vProducts = t;
            
    //     })
    //     console.log(this.vProducts);
    // }

    AddtoCart() {
        this.post({path:'api/CartItems', body: {ProductId:this.id, AppUserId:this.AppUserId, productQuantity:this.value, TotalPrice:0 } }).subscribe(res => {
                        this.vCartItem = res;
            
                        console.log(this.vCartItem);
                         alert("Added to Cart");
                     });
        // this.get({path:'api/AppUsers', params:[1],queryParams:{AppUserId:this.AppUserId, Password:this.Password}}).subscribe(res=>{
        //     this.result=res;
        //     console.log(res);
        //     if(res=="Successfully Verified")
        //     {
        //         this.post({path:'api/CartItems', body: {ProductId:this.id, AppUserId:this.AppUserId, productQuantity:this.value, TotalPrice:0 } }).subscribe(res => {
        //             this.vCartItem = res;
        
        //             console.log(this.vCartItem);
        //             alert("Added to Cart");
        //         });
        //     }
        //     // else
        //     // {
        //     //     this.router.navigateByUrl('/login');
        //     // }
        // })
        
        //this.router.navigate(['/v-cart-items'])
     }

     BuyNow()
     {
        this.get({path:'api/AppUsers', params:[1],queryParams:{AppUserId:this.AppUserId}}).subscribe(res=>{
            this.result=res;
            console.log(res);
       
            if(res=="Successfully Verified")
            {
                this.router.navigateByUrl('/transaction/add');
          
            }
            else
            {
                this.router.navigateByUrl('/login');
            }
        })
    }
   

}