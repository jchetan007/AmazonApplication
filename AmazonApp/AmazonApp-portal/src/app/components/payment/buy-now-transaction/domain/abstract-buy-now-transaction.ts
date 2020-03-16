import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { BuyNowTransaction } from '@app/models';

export class AbstractBuyNowTransaction extends RxHttp {
    buyNowTransactionFormGroup: IFormGroup<BuyNowTransaction>
}
