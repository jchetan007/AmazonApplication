import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractMusicCategory } from '../domain/abstract-music-category';
import { MusicCategory } from "@app/models";
import { Subscription } from 'rxjs';
import { Router } from '@angular/router';
import { http } from '@rxweb/http';

@http({
    hostKey: "local",
    path: "api/MusicCategories",
})


@Component({
    selector:"app-music-category-list",
    templateUrl:'./music-category-list.component.html'
})
export class MusicCategoryListComponent extends AbstractMusicCategory implements OnInit, OnDestroy {
    musicCategories: List<MusicCategory>;
    subscription: Subscription;
    id:number;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<MusicCategory>) => {
            this.musicCategories = t;
        })
    }
    constructor(private router:Router){
        super();
    }

    GetById(i :number){
       
        console.log("get by id");
        this.router.navigateByUrl("music-sub-categories/list/"+i);
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}