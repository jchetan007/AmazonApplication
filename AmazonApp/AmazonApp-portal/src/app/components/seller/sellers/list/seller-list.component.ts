import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractSeller } from '../domain/abstract-seller';
import { Seller } from "@app/models";
import { Subscription } from 'rxjs';
import { HttpClientConfig, HttpResponse, http } from '@rxweb/http';

import { anonymous } from '@rxweb/angular-router';
import { FormGroup, FormBuilder } from '@angular/forms';

@anonymous()
// @http({
//     hostKey:"local",
//     path:"api/SearchSearchProducts"
//   })

@Component({
    selector:"app-seller-list",
    templateUrl:'./seller-list.component.html'
})
export class SellerListComponent extends AbstractSeller implements OnInit, OnDestroy {
    sellers: List<Seller>;
    subscription: Subscription;
    public Product: Seller;
    searchParamns:any;
    result: any;
  
  productformgroup:FormGroup;
    proresult:any;
    
  constructor(private fb:FormBuilder){
    super();
  }

    ngOnInit(): void {
      this.Get();
          this.productformgroup=this.fb.group({
            product:['']
          })
        // this.subscription = this.get().subscribe((t: List<Seller>) => {
        //     this.sellers = t;
        //     console.log("Oninit");
        // })
    }
    Get() {
      this.get().subscribe(res => {
          this.result = res;
      })
  }

    // selectProductHandler(event:any){
    //     this.Product=event.target.value;
    //   }
    
      // Post(){
        
      // }
    
      // SearchProduct()
      // {
      //   this.post({ body: {Product: this.productformgroup.controls.product.value} }).subscribe(res=>
      //     {
      //       this.result=res;
      //       // console.log(this.result);
      //       this.proresult=JSON.parse(this.result);
      //       console.log(this.proresult);
    
      //     })
      // }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
