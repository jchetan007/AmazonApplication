import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { Language } from '@app/models';

export class AbstractLanguage extends RxHttp {
    languageFormGroup: IFormGroup<Language>
}
