import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Transaction } from '@app/models';
import { AbstractTransaction } from '../domain/abstract-transaction';
import { Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';

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
    verifyPromocodeResponse: any;
    promocodeId: any;
    result: any;
    AppUserId: any;
    CartValue: any;
    tDate: string;
    

    constructor(private formBuilder: RxFormBuilder, private activatedRoute: ActivatedRoute, private router:Router) {
        super();
    }

    ngOnInit(): void {
       
        this.AppUserId = localStorage.getItem("AppUserId");
        console.log(this.AppUserId);
        
        // this.CartValue = localStorage.getItem("CartValue");
        // console.log(this.CartValue);

        // this.get({params: [1], queryParams: { AppUserId: this.AppUserId, CartValue:this.CartValue  } }).subscribe(res => {
        //     this.result = res;
        //     console.log(this.result);
        // })
        this.transaction = new Transaction();
        this.transactionFormGroup = this.formBuilder.formGroup(this.transaction) as IFormGroup<Transaction>;

        this.tDate = new Date().toLocaleString();
       
        this.CardForm=this.formBuilder.group({
            NameonCard:"",
            CardType:"",
            CardNumber:"",
            ExpDate:"",            
            CVV:""
          
            
        });

        this.EmiForm=this.formBuilder.group({
            NameonCard:"",
            CardType:"",
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

      proceedToPay()
      {
          this.post({path:'api/Cards', body:{CardNumber:this.CardForm.value.CardNumber,CardType:this.CardForm.value.CardType, ExpiryDate:this.CardForm.value.ExpDate, Cvv:this.CardForm.value.CVV, AppUserId:this.AppUserId}}).subscribe(res => {
            this.result=res;
            console.log(this.result);
        })
      }
      
      promocodeSubmit()
      {
          this.get({path:'api/VerifyPromoCodes',params:[1],queryParams:{PromoCodeName:this.PromocodeForm.value.promocode}}).subscribe(res => {
          this.verifyPromocodeResponse = res;
          console.log(res);
  
          if(res=="Successfully Verified")
          {
            this.post({path:'api/vPromoCodes',body:{PromoCodeName:this.PromocodeForm.value.promocode,AppUserId: this.AppUserId}}).subscribe(res=>{
                this.result=res;
                 console.log(res);
                    if(this.result=="Enter Correct Promocode")
                    {
                        console.log(this.result);
                        alert("Enter Correct Promocode");
                    }
                    else
                    {
                        // this.post({path:'api/vPromoCodes',body:{PromoCodeName:this.PromocodeForm.value.promocode,AppUserId: this.AppUserId}}).subscribe(res=>{
                        //         this.result=res;
                        //          console.log(res);
                            // })   
                        // sessionStorage.setItem("AppUserId",this.result);
                        //localStorage.setItem("AppUserId", JSON.stringify(this.result));
                        // this.router.navigate(['']);
                    }
                    alert("Promocode Applied Successfully")
    //           
              })
          }

          else
          {
            console.log(this.result);
            alert("Enter Correct Promocode");
          }
      }
          )}

          placeOrder()
          {
            this.post({path:'api/Transactions', body:{appUserId:this.AppUserId,sellerDetailId:1,transactionDate:this.tDate}}).subscribe(res => {
                this.result=res;
                console.log(this.result);
                this.router.navigateByUrl('/orders'); 
            })  
           
          }
}