import { Routes, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from "@angular/router";
import { RouteProvider } from "@rxweb/angular-router"
import { Injectable } from '@angular/core';
 var routings = [
    {
       path: '', redirectTo: 'product-main-categories', pathMatch: 'full',
   },
    {
        path: "login",
        loadChildren: () => import("../login/login.module").then(m => m.LoginModule),
	},
	{
		path: "v-cart-items",
		loadChildren: () => import("../cart/v-cart-items/v-cart-item.module").then(m => m.vCartItemModule)
	},
	{
		path: "v-cart-items",
		loadChildren: () => import("../cart/v-cart-items/v-cart-item.module").then(m => m.vCartItemModule)
	},
	{
		path: "orders",
		loadChildren: () => import("../order/orders/order.module").then(m => m.OrderModule)
	},
	{
		path: "v-cart-items",
		loadChildren: () => import("../cart/v-cart-items/v-cart-item.module").then(m => m.vCartItemModule)
	},
	{
		path: "orders",
		loadChildren: () => import("../order/orders/order.module").then(m => m.OrderModule)
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
		path: "orders",
		loadChildren: () => import("../order/orders/order.module").then(m => m.OrderModule)
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
		path: "orders",
		loadChildren: () => import("../order/orders/order.module").then(m => m.OrderModule)
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
		path: "orders",
		loadChildren: () => import("../order/orders/order.module").then(m => m.OrderModule)
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
		path: "sellers",
		loadChildren: () => import("../seller/sellers/seller.module").then(m => m.SellerModule)
	},
	{
		path: "v-cart-items",
		loadChildren: () => import("../cart/v-cart-items/v-cart-item.module").then(m => m.vCartItemModule)
	},
	{
		path: "orders",
		loadChildren: () => import("../order/orders/order.module").then(m => m.OrderModule)
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
		path: "sellers",
		loadChildren: () => import("../seller/sellers/seller.module").then(m => m.SellerModule)
	},
	{
		path: "app-users",
		loadChildren: () => import("../user/app-users/app-user.module").then(m => m.AppUserModule)
	},
	{
		path: "otps",
		loadChildren: () => import("../user/otps/otp.module").then(m => m.OtpModule)
	},
	{
		path: "products",
		loadChildren: () => import("../product/products/product.module").then(m => m.ProductModule)
	},
	{
		path: "v-products",
		loadChildren: () => import("../product/v-products/v-product.module").then(m => m.vProductModule)
	},
	{
		path: "music-sub-categories",
		loadChildren: () => import("../prime-music/music-sub-categories/music-sub-category.module").then(m => m.MusicSubCategoryModule)
	},
  
	{
		path: "product-categories",
		loadChildren: () => import("../product/product-categories/product-category.module").then(m => m.ProductCategoryModule)
	},
	{
		path: "cards",
		loadChildren: () => import("../payment/cards/card.module").then(m => m.CardModule)
	},
	{
		path: "verify-promo-codes",
		loadChildren: () => import("../payment/verify-promo-codes/verify-promo-code.module").then(m => m.VerifyPromoCodeModule)
	},
	{
		path: "verify-otps",
		loadChildren: () => import("../user/verify-otps/verify-otp.module").then(m => m.VerifyOtpModule)
	},
	{
		path: "cart-items",
		loadChildren: () => import("../cart/cart-items/cart-item.module").then(m => m.CartItemModule)
	},
	{
		path: "music-categories",
		loadChildren: () => import("../prime-music/music-categories/music-category.module").then(m => m.MusicCategoryModule)
	},
	{
		path: "product-main-categories",
		loadChildren: () => import("../product/product-main-categories/product-main-category.module").then(m => m.ProductMainCategoryModule)
	},
	{
		path: "product-sub-categories",
		loadChildren: () => import("../product/product-sub-categories/product-sub-category.module").then(m => m.ProductSubCategoryModule)
	},
	
	{
		path: "user-addresses",
		loadChildren: () => import("../user/user-addresses/user-address.module").then(m => m.UserAddressModule)
	},
	{
		path: "v-promo-codes",
		loadChildren: () => import("../payment/v-promo-codes/v-promo-code.module").then(m => m.vPromoCodeModule)
	},
	{
		path: "v-promo-codes",
		loadChildren: () => import("../payment/v-promo-codes/v-promo-code.module").then(m => m.vPromoCodeModule)
	},
	{
		path: "musics",
		loadChildren: () => import("../prime-music/musics/music.module").then(m => m.MusicModule)
	},
	{
		path: "v-promo-codes",
		loadChildren: () => import("../payment/v-promo-codes/v-promo-code.module").then(m => m.vPromoCodeModule)
	},
	{
		path: "musics",
		loadChildren: () => import("../prime-music/musics/music.module").then(m => m.MusicModule)
	},
	{
		path: "v-promo-codes",
		loadChildren: () => import("../payment/v-promo-codes/v-promo-code.module").then(m => m.vPromoCodeModule)
	},
	{
		path: "musics",
		loadChildren: () => import("../prime-music/musics/music.module").then(m => m.MusicModule)
	},
	{
		path: "v-promo-codes",
		loadChildren: () => import("../payment/v-promo-codes/v-promo-code.module").then(m => m.vPromoCodeModule)
	},
	{
		path: "musics",
		loadChildren: () => import("../prime-music/musics/music.module").then(m => m.MusicModule)
	},
	//{
	// 	path: "buy-now-transaction",
	// 	loadChildren: () => import("../payment/buy-now-transaction/buy-now-transaction.module").then(m => m.BuyNowTransactionModule)
	// },
	// {
	// 	path: "buy-now-transaction",
	// 	loadChildren: () => import("../payment/buy-now-transaction/buy-now-transaction.module").then(m => m.BuyNowTransactionModule)
	// },
	{
		path: "v-musics",
		loadChildren: () => import("../prime-music/v-musics/v-music.module").then(m => m.vMusicModule)
	},
	// {
	// 	path: "buy-now-transaction",
	// 	loadChildren: () => import("../payment/buy-now-transaction/buy-now-transaction.module").then(m => m.BuyNowTransactionModule)
	// },
	{
		path: "v-musics",
		loadChildren: () => import("../prime-music/v-musics/v-music.module").then(m => m.vMusicModule)
	},
	// {
	// 	path: "buy-now-transaction",
	// 	loadChildren: () => import("../payment/buy-now-transaction/buy-now-transaction.module").then(m => m.BuyNowTransactionModule)
	// },
	{
		path: "v-musics",
		loadChildren: () => import("../prime-music/v-musics/v-music.module").then(m => m.vMusicModule)
	},
	// {
	// 	path: "seller-detail-forms",
	// 	loadChildren: () => import("../seller/seller-detail-forms/seller-detail-form.module").then(m => m.SellerDetailFormModule)
	// },
	// {
	// 	path: "buy-now-transaction",
	// 	loadChildren: () => import("../payment/buy-now-transaction/buy-now-transaction.module").then(m => m.BuyNowTransactionModule)
	// },
	{
		path: "v-musics",
		loadChildren: () => import("../prime-music/v-musics/v-music.module").then(m => m.vMusicModule)
	},
	// {
	// 	path: "seller-detail-forms",
	// 	loadChildren: () => import("../seller/seller-detail-forms/seller-detail-form.module").then(m => m.SellerDetailFormModule)
	// },
	// {
	// 	path: "verify-login",
	// 	loadChildren: () => import("../user/verify-login/verify-login.module").then(m => m.VerifyLoginModule)
	// },
	{
		path: "buy-now-transaction",
		loadChildren: () => import("../payment/buy-now-transaction/buy-now-transaction.module").then(m => m.BuyNowTransactionModule)
	},
	{
		path: "buy-now-transaction",
		loadChildren: () => import("../payment/buy-now-transaction/buy-now-transaction.module").then(m => m.BuyNowTransactionModule)
	},
	{
		path: "buy-now-transaction",
		loadChildren: () => import("../payment/buy-now-transaction/buy-now-transaction.module").then(m => m.BuyNowTransactionModule)
	},
	{
		path: "buy-now-transaction",
		loadChildren: () => import("../payment/buy-now-transaction/buy-now-transaction.module").then(m => m.BuyNowTransactionModule)
	},
	
	{
		path: "buy-now-transaction",
		loadChildren: () => import("../payment/buy-now-transaction/buy-now-transaction.module").then(m => m.BuyNowTransactionModule)
	},
	
	

] 
       
       
    
       
       
        
        
//generated code
//])


export const ROUTES: Routes = routings;







console.log(ROUTES)

