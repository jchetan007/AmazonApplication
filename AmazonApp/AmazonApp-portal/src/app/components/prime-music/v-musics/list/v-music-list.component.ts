import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractvMusic } from '../domain/abstract-v-music';
import { vMusic } from "@app/models";
import { Subscription } from 'rxjs';
import { anonymous } from '@rxweb/angular-router';
import { RxFormBuilder } from '@rxweb/reactive-form-validators';
import { ActivatedRoute, Router } from '@angular/router';



@anonymous()
@Component({
    selector:"app-v-music-list",
    templateUrl:'./v-music-list.component.html'
})
export class vMusicListComponent extends AbstractvMusic implements OnInit, OnDestroy {
    vMusics: List<vMusic>;
    subscription: Subscription;
    id: any;



    
    constructor(private formBuilder: RxFormBuilder, private activatedRoute: ActivatedRoute, private router:Router) {
        super();
        this.activatedRoute.params.subscribe(t => {
            this.id = t['id'];
        })
        
    }

    ngOnInit(): void {
        this.get({params:[this.id],queryParams:{MusicId:this.id}}).subscribe((t: List<vMusic>) => {
            this.vMusics = t;

            this.get();
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
