import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vMusicBase {

//#region musicId Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'musicId', keyColumn: true})
        musicId : number;
//#endregion musicId Prop


//#region musicName Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'musicName', keyColumn: false})
        musicName : string;
//#endregion musicName Prop


//#region albumName Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'albumName', keyColumn: false})
        albumName : string;
//#endregion albumName Prop


//#region artistName Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'artistName', keyColumn: false})
        artistName : string;
//#endregion artistName Prop


//#region musicSubCategoryId Prop
        @gridColumn({visible: true, columnIndex:4, allowSorting: true, headerKey: 'musicSubCategoryId', keyColumn: false})
        musicSubCategoryId : number;
//#endregion musicSubCategoryId Prop


//#region categoryName Prop
        @gridColumn({visible: true, columnIndex:5, allowSorting: true, headerKey: 'categoryName', keyColumn: false})
        categoryName : string;
//#endregion categoryName Prop


//#region musicCategoryName Prop
        @gridColumn({visible: true, columnIndex:6, allowSorting: true, headerKey: 'musicCategoryName', keyColumn: false})
        musicCategoryName : string;
//#endregion musicCategoryName Prop

}