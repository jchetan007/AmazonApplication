import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractProductSubCategory } from '../domain/abstract-product-sub-category';
import { ProductSubCategory } from "@app/models";
import { Subscription } from 'rxjs';
import { Router, ActivatedRoute } from '@angular/router';


@Component({
    selector:"app-product-sub-category-list",
    templateUrl:'./product-sub-category-list.component.html'
})
export class ProductSubCategoryListComponent extends AbstractProductSubCategory implements OnInit, OnDestroy {
    productSubCategories: List<ProductSubCategory>;
    subscription: Subscription;
    Psid:number;
    id:number;
    result:any;

    
    ngOnInit(): void {

       // sessionStorage.getItem("pc");
      //  this.GetById(this.Psid);
        this.get({params:[this.id],queryParams:{productCategoryId:this.id}}).subscribe((t: List<ProductSubCategory>) => {
            console.log(t);  
            //this.result=t;  
            this.productSubCategories = t;
            
        //   console.log(this.result);
        //   this.id=Number.parseInt(this.result[0].ProductSubCategoryId);
        //   console.log(this.result[0].ProductSubCategoryId);
        })
        
       
    }

    constructor(private router:Router,private activatedRoute:ActivatedRoute){
        super();
        this.activatedRoute.params.subscribe(t => {
            this.id = t['id'];
            
        })
        console.log(this.id);
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

    // GetById(i :number){
      
    //     this.router.navigateByUrl("products/list/"+i);
        
    //     // this.get({params:[i],queryParams:{ProductSubCategoryId:this.Psid}}).subscribe((t:List<ProductSubCategory>)=>{
    //     //     this.productSubCategories=t;
    //     //     // this.Get();
    //     //     this.router.navigateByUrl("product-categories");
    //     //     sessionStorage.setItem("psc",this.Psid.toString());
            
    //     // })
    //     console.log(this.productSubCategories);
    // }

}
