import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { MusicSubCategory } from '@app/models';

export class AbstractMusicSubCategory extends RxHttp {
    musicSubCategoryFormGroup: IFormGroup<MusicSubCategory>
}
