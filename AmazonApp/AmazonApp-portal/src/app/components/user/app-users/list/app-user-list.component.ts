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

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<AppUser>) => {
            this.appUsers = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
