import { Injectable } from '@angular/core';
import { Subject, Observable } from 'rxjs';


@Injectable()
export class ApplicationBroadcaster {
  private loginSubject: Subject<boolean> = new Subject<boolean>();
  public loginSubscriber: Observable<boolean>;

  private boutiqueSubject: Subject<boolean> = new Subject<boolean>();
  public boutiqueSubscriber: Observable<boolean>;



  private forgotPasswordSubject: Subject<boolean> = new Subject<boolean>();
  public forgotPasswordSubscriber: Observable<boolean>;

  private resetPasswordSubject: Subject<boolean> = new Subject<boolean>();
  public resetPasswordSubscriber: Observable<boolean>;

  private memberFeedbackSubject: Subject<boolean> = new Subject<boolean>();
  public memberFeedbackSubscriber: Observable<boolean>;

  private menuLevelSubject: Subject<any> = new Subject<any>();
  public menuLevelSubscriber: Observable<any>;

  constructor() {
    this.loginSubscriber = this.loginSubject.asObservable();
    this.boutiqueSubscriber = this.boutiqueSubject.asObservable();

    this.forgotPasswordSubscriber = this.forgotPasswordSubject.asObservable();
    this.resetPasswordSubscriber = this.resetPasswordSubject.asObservable();
    this.memberFeedbackSubscriber = this.memberFeedbackSubject.asObservable();
    this.menuLevelSubscriber = this.menuLevelSubject.asObservable();
  }

  activeMenu(activeMenu: any): void {
    this.menuLevelSubject.next(activeMenu);
  }

  loginBroadCast(value: boolean): void {
    this.loginSubject.next(value);
  }

  boutiqueBroadCast(): void {
    this.boutiqueSubject.next();
  }



  forgotPasswordBroadCast(value: boolean): void {
    this.forgotPasswordSubject.next(value);
  }

  resetPasswordBrodcast(value: boolean): void {
    this.resetPasswordSubject.next(value);
  }

  memberFeedbackBrodcast(value: boolean): void {
    this.memberFeedbackSubject.next(value);
  }
}
