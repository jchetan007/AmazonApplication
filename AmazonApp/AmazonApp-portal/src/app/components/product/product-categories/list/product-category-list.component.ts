import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractProductCategory } from '../domain/abstract-product-category';
import { ProductCategory } from "@app/models";
import { Subscription } from 'rxjs';
import { Router, ActivatedRoute } from '@angular/router';


@Component({
    selector:"app-product-category-list",
    templateUrl:'./product-category-list.component.html'
})
export class ProductCategoryListComponent extends AbstractProductCategory implements OnInit, OnDestroy {
    productCategories: List<ProductCategory>;
    subscription: Subscription;
    id:number;
    Pid:number;
   //data:any=temp;
   constructor(private router:Router,private activatedRoute:ActivatedRoute){
    super();
    this.activatedRoute.params.subscribe(t => {
        this.id = t['id'];
        console.log(t);
    })
}
    ngOnInit(): void {

        //  sessionStorage.getItem("pmc");
      
        // this.GetById(this.Pid);
        console.log(this.id);
        this.get({params:[this.id],queryParams:{productMainCategoryId:this.id}}).subscribe((t:List<ProductCategory>)=>{
            console.log(t);    
            this.productCategories=t;
                
                // this.Get();
              
                // sessionStorage.setItem("pmc",this.id.toString());
               
            })
    //     this.get({params:[1],queryParams:{productMainCategoryId:parseInt(sessionStorage.getItem("pmc"))}}).subscribe((t:List<ProductCategory>)=>{
    //         this.productCategories = t;
            
           
   
    //    // this.subscription = this.get().subscribe((t: List<ProductCategory>) => {
    //      //   this.productCategories = t;
    //     })
    }
   

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }


    
GetById(i :number){
   
    this.router.navigateByUrl("product-sub-categories/list/"+i);
    
    // this.get({params:[i],queryParams:{ProductCategoryId:this.Pid}}).subscribe((t:List<ProductCategory>)=>{
    //     this.productCategories = t;
    //    this.router.navigateByUrl("product-sub-categories");
    //    sessionStorage.setItem("pc",this.Pid.toString());
    // })
    

    // var x=sessionStorage.getItem("pmc");
console.log(this.productCategories);

}
}