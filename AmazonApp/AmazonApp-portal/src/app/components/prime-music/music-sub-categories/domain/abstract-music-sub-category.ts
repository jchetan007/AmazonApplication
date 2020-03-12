import { RxHttp, http } from "@rxweb/http";
import { IFormGroup } from '@rxweb/reactive-form-validators';
import { MusicSubCategory } from '@app/models';

@http({
    hostKey:'local',
    path:'api/MusicCategories'
})

export class AbstractMusicSubCategory extends RxHttp {
    musicSubCategoryFormGroup: IFormGroup<MusicSubCategory>
}
