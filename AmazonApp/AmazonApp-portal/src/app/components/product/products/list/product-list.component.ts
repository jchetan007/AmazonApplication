import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractProduct } from '../domain/abstract-product';
import { Product } from "@app/models";
import { Subscription } from 'rxjs';
import { anonymous } from '@rxweb/angular-router';
import { FormGroup,Validators,FormBuilder } from "@angular/forms"
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';
import { http } from '@rxweb/http';
import { vProduct } from "@app/models";

@http({
    hostKey: "local",
    path: "api/vProducts",
})

@anonymous()
@Component({
    selector:"app-product-list",
    templateUrl:'./product-list.component.html'
})
export class ProductListComponent extends AbstractProduct implements OnInit, OnDestroy {
    //products: List<Product>;
    subscription: Subscription;
    cartForm:FormGroup;
    id: number;
    productId: any;
    productQuantity: any;
    AppUserId: any;
    vCartItem: unknown;
    vProducts: any;products:any;
    

    constructor(private formBuilder: RxFormBuilder, private activatedRoute: ActivatedRoute) {
        super();
        this.activatedRoute.params.subscribe(t => {
            this.id = t['id'];
        })
        
    }

    ngOnInit(): void {
         this.get({path:'api/vProducts',params:[this.id],queryParams:{ProductSubCategoryId:this.id}}).subscribe((t: List<vProduct>) => {
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
        this.cartForm=this.formBuilder.group({
            productQuantity:[""]
        });
        console.log(this.id); 
      }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();

           
    }

    // GetById(i:number) {
    //     this.get({path:'api/vProducts',params:[this.id],queryParams:{ProductSubCategoryId:i}}).subscribe(t=>{
    //         this.vProducts=t})
        
    //     console.log(this.vProducts);
    // }

    AddtoCart() {
        this.post({ body: {path:'api/CartItems',ProductId:this.productId, productQuantity:this.productQuantity, AppUserId:this.AppUserId} }).subscribe(res => {
            this.vCartItem = res;
        })
     }
   

}
