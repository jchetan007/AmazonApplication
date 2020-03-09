import { RxHttp } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { MusicCategory } from '@app/models';

export class AbstractMusicCategory extends RxHttp {
    musicCategoryFormGroup: IFormGroup<MusicCategory>
}
