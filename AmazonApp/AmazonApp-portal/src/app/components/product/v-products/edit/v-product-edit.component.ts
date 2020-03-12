import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractvProduct } from '../domain/abstract-v-product';
import { List } from "@rxweb/generics"
import { RxHttp,http } from "@rxweb/http";
import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';
import { vCartItem } from '@app/models';
import { vProduct } from '@app/models';

// @http({
//     hostKey: "local",
//     path: "api/CartItems",
// })

@Component({
    selector: "app-v-product-edit",
    templateUrl: './v-product-edit.component.html'
})
export class vProductEditComponent extends AbstractvProduct implements OnInit, OnDestroy {
    public vProducts: List<vProduct>;
    subscription: Subscription;
    id: number;
    result:any;
    CartItem:any;
    productName: any;
    discountProductPrice: any;
    originalProductPrice: any;
    productQuantity: any;
    productId: any;
    cartItemId: any;
   

    constructor(private formBuilder: RxFormBuilder, private activatedRoute: ActivatedRoute) {
        super();
        this.activatedRoute.queryParams.subscribe(t => {
            this.id = t['id'];
        })
    }

    ngOnInit(): void {
        // this.Get();
        // this.get({ params: [this.id] }).subscribe(t => {
        //     this.vProductFormGroup = this.formBuilder.formGroup(vProduct,t) as IFormGroup<vProduct>;
        // })
         this.GetById(this.id);
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }


    // Get() {
    //     this.get().subscribe(res => {
    //         this.result = res;
    //     })
        // this.subscription = this.get().subscribe((t: List<vProduct>) => {
        //     this.vProducts=JSON.parse(this.result);
        // })
        //console.log(this.vProducts);
   // }

    GetById(i:number) {
        this.get({params:[i],queryParams:{ProductId:this.id}}).subscribe((t:List<vProduct>)=>{this.vProducts=t})
        console.log(this.vProducts);
    }

//     Post()
//     {
//         this.post({body:{Product:this.id}}).subscribe(res=>{
//             this.result=res;
//             this.vProducts=JSON.parse(this.result);
        

//     })
// }

 Post() {
    //  this.post({ body: {ProductId:this.productId, productQuantity:this.productQuantity,appUserId:this.appUserId} }).subscribe(res => {
    //      this.CartItem = res;
    //  })
  }


}