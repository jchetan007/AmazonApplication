import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractAppUser } from '../domain/abstract-app-user';
import { AppUser } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-app-user-list",
    templateUrl:'./app-user-list.component.html'
})
export class AppUserListComponent extends AbstractAppUser implements OnInit, OnDestroy {
    appUsers: List<AppUser>;
    subscription: Subscription;
      result:any;

    ngOnInit(): void {
       this.Post();
        }
        Post() {
            this.post({body:{mobilenumber:"",password:""}}).subscribe(res => {
              this.result = res;
            })
        
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
