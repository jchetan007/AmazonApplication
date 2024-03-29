import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { FormGroup,Validators,FormBuilder } from "@angular/forms"

import { RxFormBuilder, IFormGroup, RxwebValidators } from '@rxweb/reactive-form-validators';

import { Seller } from '@app/models';
import { AbstractSeller } from '../domain/abstract-seller';
import { HttpClientConfig, HttpResponse, http } from '@rxweb/http';
import { ActivatedRoute, Router } from '@angular/router';
import { anonymous } from '@rxweb/angular-router';


@anonymous()
@http({
    hostKey: "local",
    path: "api/SellerDetailForms",
})



@Component({
    selector: "app-seller-add",
    templateUrl: './seller-add.component.html'
})
export class SellerAddComponent extends AbstractSeller implements OnInit, OnDestroy {
    seller: Seller;
    subscription: Subscription;
    registerForm:FormGroup;
    infoForm:FormGroup;
    taxForm:FormGroup;
    launchForm:FormGroup; 
    result:any;  
    AppUserId: any;
    // id:number;


    constructor(private formBuilder: RxFormBuilder,private activatedRouter: ActivatedRoute,private router:Router) {
        super();
    }

    ngOnInit(): void {
        console.log("Seller Add")
        // if(!sessionStorage.getItem('AppUserId'))
        // {
        //     this.router.navigate(['login'])
        // }
        this.AppUserId = localStorage.getItem("AppUserId");
        console.log(this.AppUserId);

        //this.AppUserId=JSON.parse(sessionStorage.getItem('AppUserId')).AppUserId
        //console.log(this.AppUserId);
        // this.get({ params: [1], queryParams: { AppUserId: this.AppUserId } }).subscribe(res => {
        //     this.result = res;
        //     console.log(this.result);
            // console.log(this.result.companyId[0])
        // })
        // sessionStorage.getItem("AppUserId");
        // this.get({params:[1], queryParams:{AppUserId:Number.parseInt(sessionStorage.getItem('AppUserId'))} }).subscribe(res => {
        //     this.result = res;
        // })
        // this.id=Number.parseInt(sessionStorage.getItem('AppUserId'));
        this.seller = new Seller();
        this.sellerFormGroup = this.formBuilder.formGroup(this.seller) as IFormGroup<Seller>;

        this.registerForm=this.formBuilder.group({
            companyName:['',RxwebValidators.required()]
        });
        this.infoForm=this.formBuilder.group({
            StoreName:"",
            area:['',RxwebValidators.required()],
            address:['',RxwebValidators.required()],
            landmark:['',RxwebValidators.required()],
            city:['',RxwebValidators.required()],
            state:['',RxwebValidators.required()],
            addresstype:['',RxwebValidators.required()]
            
        });
        this.taxForm=this.formBuilder.group({
            state:['',RxwebValidators.required()],
            gstin:"",
            panNumber:['',RxwebValidators.required()]

        });      
        this.launchForm=this.formBuilder.group({
            barcode:"",
            accountHolderName:['',RxwebValidators.required()],
            accountType:['',RxwebValidators.required()],
            accountNumber:['',RxwebValidators.required()],
            ReEnter:['',RxwebValidators.required()],
            Code:"",
            panNumber:['',RxwebValidators.required()],
            Provisional:"",
            signature:""
        }) 
        // this.GetByQueryParams('ProductCategoryName');

    }
    

    // GetByQueryParams(ProductCategoryName:string) {
    //     this.get({queryParams:[ProductCategoryName]}).subscribe(res => {
    //         this.result = res;
    //     })
    // }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

    private selectedLink: string="gst1";string="gst2";  
    setradio(e: string): void   
  {  
  
    this.selectedLink = e;  
          
  }    

    isSelected(name: string): boolean   
    {  
    
          if (!this.selectedLink) { // if no radio button is selected, always return false so every nothing is shown  
              return false;  
    }  
    
          return (this.selectedLink === name); // if current radio button is selected, return true, else return false  
      }  
    
     
    submit(){
         this.post({ body: {
             companyName:this. registerForm.controls.companyName.value,
             address:this.infoForm.controls.address.value,
             panNumber:this.launchForm.controls.panNumber.value,
             area:this.infoForm.controls.area.value,
             landmark:this.infoForm.controls.landmark.value,
             city:this.infoForm.controls.city.value,
             state:this.infoForm.controls.state.value,
             addresstype:this.infoForm.controls.addresstype.value,
             accountHolderName:this.launchForm.controls.accountHolderName.value,
             accountType:this.launchForm.controls.accountType.value,
             accountNumber:this.launchForm.controls.accountNumber.value,
             AppUserId: this.AppUserId 
        } }).subscribe(res => {
         this.result=res;
         console.log(this.result);
     })

    }

}
