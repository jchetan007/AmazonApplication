import { Routes, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from "@angular/router";
import { RouteProvider } from "@rxweb/angular-router"
import { Injectable } from '@angular/core';
var routings = [
    {
        path: '', redirectTo: 'login', pathMatch: 'full',
    },
    {
        path: "login",
        loadChildren: () => import("../login/login.module").then(m => m.LoginModule),
    }, {
		path: "v-cart-items",
		loadChildren: () => import("../cart/v-cart-items/v-cart-item.module").then(m => m.vCartItemModule)
	},
	{
		path: "v-cart-items",
		loadChildren: () => import("../cart/v-cart-items/v-cart-item.module").then(m => m.vCartItemModule)
	},
	{
		path: "promo-codes",
		loadChildren: () => import("../payment/promo-codes/promo-code.module").then(m => m.PromoCodeModule)
	},
	{
		path: "transactions",
		loadChildren: () => import("../payment/transactions/transaction.module").then(m => m.TransactionModule)
	},
	{
		path: "v-cart-items",
		loadChildren: () => import("../cart/v-cart-items/v-cart-item.module").then(m => m.vCartItemModule)
	},
	{
		path: "promo-codes",
		loadChildren: () => import("../payment/promo-codes/promo-code.module").then(m => m.PromoCodeModule)
	},
	{
		path: "transactions",
		loadChildren: () => import("../payment/transactions/transaction.module").then(m => m.TransactionModule)
	},
	{
		path: "prime-musics",
		loadChildren: () => import("../prime-music/prime-musics/prime-music.module").then(m => m.PrimeMusicModule)
	},
	{
		path: "v-cart-items",
		loadChildren: () => import("../cart/v-cart-items/v-cart-item.module").then(m => m.vCartItemModule)
	},
	{
		path: "promo-codes",
		loadChildren: () => import("../payment/promo-codes/promo-code.module").then(m => m.PromoCodeModule)
	},
	{
		path: "transactions",
		loadChildren: () => import("../payment/transactions/transaction.module").then(m => m.TransactionModule)
	},
	{
		path: "prime-musics",
		loadChildren: () => import("../prime-music/prime-musics/prime-music.module").then(m => m.PrimeMusicModule)
	},
	{
		path: "brands",
		loadChildren: () => import("../product/brands/brand.module").then(m => m.BrandModule)
	},
	{
		path: "colors",
		loadChildren: () => import("../product/colors/color.module").then(m => m.ColorModule)
	},
	{
		path: "discounts",
		loadChildren: () => import("../product/discounts/discount.module").then(m => m.DiscountModule)
	},
	{
		path: "languages",
		loadChildren: () => import("../product/languages/language.module").then(m => m.LanguageModule)
	},
	{
		path: "materials",
		loadChildren: () => import("../product/materials/material.module").then(m => m.MaterialModule)
	},
	{
		path: "sizes",
		loadChildren: () => import("../product/sizes/size.module").then(m => m.SizeModule)
	},
	{
		path: "v-cart-items",
		loadChildren: () => import("../cart/v-cart-items/v-cart-item.module").then(m => m.vCartItemModule)
	},
	{
		path: "promo-codes",
		loadChildren: () => import("../payment/promo-codes/promo-code.module").then(m => m.PromoCodeModule)
	},
	{
		path: "transactions",
		loadChildren: () => import("../payment/transactions/transaction.module").then(m => m.TransactionModule)
	},
	{
		path: "prime-musics",
		loadChildren: () => import("../prime-music/prime-musics/prime-music.module").then(m => m.PrimeMusicModule)
	},
	{
		path: "brands",
		loadChildren: () => import("../product/brands/brand.module").then(m => m.BrandModule)
	},
	{
		path: "colors",
		loadChildren: () => import("../product/colors/color.module").then(m => m.ColorModule)
	},
	{
		path: "discounts",
		loadChildren: () => import("../product/discounts/discount.module").then(m => m.DiscountModule)
	},
	{
		path: "languages",
		loadChildren: () => import("../product/languages/language.module").then(m => m.LanguageModule)
	},
	{
		path: "materials",
		loadChildren: () => import("../product/materials/material.module").then(m => m.MaterialModule)
	},
	{
		path: "sizes",
		loadChildren: () => import("../product/sizes/size.module").then(m => m.SizeModule)
	},
	{
		path: "app-users",
		loadChildren: () => import("../user/app-users/app-user.module").then(m => m.AppUserModule)
	},
	{
		path: "otps",
		loadChildren: () => import("../user/otps/otp.module").then(m => m.OtpModule)
	}
]
       
//generated code
//])


export const ROUTES: Routes = routings;







console.log(ROUTES)

