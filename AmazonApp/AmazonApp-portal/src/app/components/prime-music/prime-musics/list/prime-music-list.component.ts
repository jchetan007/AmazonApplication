import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractPrimeMusic } from '../domain/abstract-prime-music';
import { PrimeMusic } from "@app/models";
import { Subscription } from 'rxjs';
import { anonymous } from '@rxweb/angular-router';


@anonymous()
@Component({
    selector:"app-prime-music-list",
    templateUrl:'./prime-music-list.component.html'
})
export class PrimeMusicListComponent extends AbstractPrimeMusic implements OnInit, OnDestroy {
    primeMusics: List<PrimeMusic>;
    subscription: Subscription;
    id:any;

    ngOnInit(): void {
        //this.GetById(1);
        this.subscription =this.get({params:[this.id],queryParams:{MusicSubCategoryId:this.id}}).subscribe((t:List<PrimeMusic>) => {
            this.primeMusics = t});      
       console.log(this.primeMusics)
        }

        // GetById(id:number) 
        // {
        // }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();

    }
   
}