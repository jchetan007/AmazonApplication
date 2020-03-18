import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

//import { BuyNowTransaction } from '@app/models';
import { AbstractBuyNowTransaction } from '../domain/abstract-buy-now-transaction';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
    selector: "app-buy-now-transaction-add",
    templateUrl: './buy-now-transaction-add.component.html'
})
export class BuyNowTransactionAddComponent extends AbstractBuyNowTransaction implements OnInit, OnDestroy {
   // buyNowTransaction: BuyNowTransaction;
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
    amount: any;

    constructor(private formBuilder: RxFormBuilder, private activatedRoute: ActivatedRoute, private router:Router) {
        super();
    }

    ngOnInit(): void {
        this.AppUserId = localStorage.getItem("AppUserId");
        this.amount=localStorage.getItem("Amount");
        console.log(this.AppUserId);
       // this.buyNowTransaction = new BuyNowTransaction();
       // this.buyNowTransactionFormGroup = this.formBuilder.formGroup(this.buyNowTransaction) as IFormGroup<BuyNowTransaction>;

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

    private selectedLink: string="onlinepayment";string="emi";  
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
            this.post({path:'api/BuyNowTransaction', body:{appUserId:this.AppUserId,sellerDetailId:1,amount:this.amount,transactionDate:this.tDate}}).subscribe(res => {
                this.result=res;
                console.log(this.result);
                this.router.navigateByUrl('/orders'); 
            })  
           
          }

}
