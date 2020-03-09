import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Transaction } from '@app/models';
import { AbstractTransaction } from '../domain/abstract-transaction';
import { Validators } from '@angular/forms';

@Component({
    selector: "app-transaction-add",
    templateUrl: './transaction-add.component.html'
})
export class TransactionAddComponent extends AbstractTransaction implements OnInit, OnDestroy {
    transaction: Transaction;
    subscription: Subscription;
    CardForm: any;
    EmiForm: any;
    PromocodeForm: any;
    

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.transaction = new Transaction();
        this.transactionFormGroup = this.formBuilder.formGroup(this.transaction) as IFormGroup<Transaction>;

       
        this.CardForm=this.formBuilder.group({
            NameonCard:"",
            CardNumber:"",
            ExpDate:"",            
            CVV:""
          
            
        });

        this.EmiForm=this.formBuilder.group({
            NameonCard:"",
            CardNumber:"",            
            ExpDate:"",
            CVV:""
          
        });  

        this.PromocodeForm=this.formBuilder.group({
            promocode:""
          
        });     

        
    }

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
      
    //   promocodeSubmit()
    //   {
    //       this.get({path:'api/VerifyPromoCodes',params:[1],queryParams:{PromoCodeId:this.promocodeId, PromoCodeName:this.userFormGroup.value.promocodename}}).subscribe(res => {
    //       this.verifyPromocodeResponse = res;
    //       console.log(res);
  
    //       if(res=="Successfully Verified")
    //       {
    //           this.post({path:'api/vCartItems',body:{ appusername:this.userFormGroup.value.appusername,
    //               mobilenumber:this.userFormGroup.value.mobilenumber,
    //               emailid:this.userFormGroup.value.emailid,
    //               userPassword:this.userFormGroup.value.password}}).subscribe(res=>{
    //               this.result=res;
    //               console.log(res);
    //           })
    //       }
    //   }
    //       )}
}