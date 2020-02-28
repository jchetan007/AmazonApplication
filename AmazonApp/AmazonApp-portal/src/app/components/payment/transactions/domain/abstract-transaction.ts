import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Transaction } from '@app/models';

export class AbstractTransaction extends RxHttp {
    transactionFormGroup: IFormGroup<Transaction>
}
