import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractMusicSubCategory } from '../domain/abstract-music-sub-category';
import { MusicSubCategory } from "@app/models";
import { Subscription } from 'rxjs';
import { Router, ActivatedRoute } from '@angular/router';



@Component({
    selector:"app-music-sub-category-list",
    templateUrl:'./music-sub-category-list.component.html'
})
export class MusicSubCategoryListComponent extends AbstractMusicSubCategory implements OnInit, OnDestroy {
    musicSubCategories: List<MusicSubCategory>;
    subscription: Subscription;
    id: any;

    ngOnInit(): void {
        this.get({params:[this.id],queryParams:{MusicCategoryId:this.id}}).subscribe((t: List<MusicSubCategory>) => {
           // console.log(t);  
            this.musicSubCategories = t;


           // console.log(this.musicSubCategories)
        })
    }
    constructor(private router:Router,private activatedRoute:ActivatedRoute){
        super();
        this.activatedRoute.params.subscribe(t => {
            this.id = t['id'];
            console.log(t);
        })
    }

    GetById(i :number){
   
        this.router.navigateByUrl("musics/list/"+i);
        console.log(this.musicSubCategories);
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }
   

}