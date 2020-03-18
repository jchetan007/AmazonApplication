import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractMusic } from '../domain/abstract-music';
import { Music, vMusic } from "@app/models";
import { Subscription } from 'rxjs';
import { http } from '@rxweb/http';
import { anonymous } from '@rxweb/angular-router';
import { RxFormBuilder } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';


@http({
    hostKey: "local",
    path: "api/vMusics",
})
@anonymous()
@Component({
    selector:"app-music-list",
    templateUrl:'./music-list.component.html'
})
export class MusicListComponent extends AbstractMusic implements OnInit, OnDestroy {
    musics: List<Music>;
    subscription: Subscription;
    id: any;
    vMusics: List<any>;


    constructor(private formBuilder: RxFormBuilder, private activatedRoute: ActivatedRoute) {
        super();
        this.activatedRoute.params.subscribe(t => {
            this.id = t['id'];
        })
        
    }

    ngOnInit(): void {
        this.get({path:'api/vMusics',params:[this.id],queryParams:{MusicSubCategoryId:this.id}}).subscribe((t: List<vMusic>) => {
            this.vMusics = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
