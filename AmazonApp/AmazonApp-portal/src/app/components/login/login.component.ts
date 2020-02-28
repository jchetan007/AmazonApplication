import { Component, OnInit } from '@angular/core';
import { anonymous, middleware } from '@rxweb/angular-router'
import { multilingual } from '@rxweb/localization'
import { CoreComponent } from '@rxweb/angular-router';
import { LoggedInMiddleware } from '../../domain/security/middleware/logged-in.middleware';

@middleware([LoggedInMiddleware])
@multilingual("loginComponent")
@anonymous()
@Component({
    templateUrl: './login.component.html',
})
export class LoginComponent extends CoreComponent implements OnInit {
    ngOnInit(): void {
        throw new Error("Method not implemented.");
    }
    
}
