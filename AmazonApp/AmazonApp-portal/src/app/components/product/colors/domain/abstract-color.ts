import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Color } from '@app/models';

export class AbstractColor extends RxHttp {
    colorFormGroup: IFormGroup<Color>
}
