import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Card } from '@app/models';

export class AbstractCard extends RxHttp {
    cardFormGroup: IFormGroup<Card>
}
