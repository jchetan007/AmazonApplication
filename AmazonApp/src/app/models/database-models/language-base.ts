import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class LanguageBase {

//#region languageId Prop
        @prop()
        languageId : number;
//#endregion languageId Prop


//#region languageName Prop
        @required()
        @maxLength({value:20})
        languageName : string;
//#endregion languageName Prop



}