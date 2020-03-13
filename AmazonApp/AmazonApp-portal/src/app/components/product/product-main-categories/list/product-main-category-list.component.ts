import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractProductMainCategory } from '../domain/abstract-product-main-category';
import { ProductMainCategory } from "@app/models";
import { Subscription } from 'rxjs';
import { Router } from '@angular/router';
import { RxHttp, http} from "@rxweb/http";

@http({
    hostKey: "local",
    path: "api/ProductMainCategories",
})


@Component({
    selector:"app-product-main-category-list",
    templateUrl:'./product-main-category-list.component.html'
})
export class ProductMainCategoryListComponent extends AbstractProductMainCategory implements OnInit, OnDestroy {
    productMainCategories: List<ProductMainCategory>;
    subscription: Subscription;
    id:number;

    ngOnInit(): void {
        console.log("ngoninit ");
        
        
            // this.GetById(this.id);
            console.log("ngoninit called");
        
        }

        constructor(private router:Router){
            super();
        }
        // Get(){
        //     this.subscription = this.get().subscribe((t:List<ProductMainCategory>)=>{
        //         this.productMainCategories=t;
        //     })
        //     console.log(this.productMainCategories);
        // }

   
   
    
    GetById(i :number){
       
        console.log("get by id");
        this.router.navigateByUrl("product-categories/list/"+i);
    // this.get({params:[i],queryParams:{ProductMainCategoryId:this.id}}).subscribe((t:List<ProductMainCategory>)=>{
    //     this.productMainCategories=t;
    //     // this.Get();
      
    //     sessionStorage.setItem("pmc",this.id.toString());
       
    // })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}