#region Namespace
using Microsoft.Extensions.DependencyInjection;
using AmazonApp.Infrastructure.Security;
using RxWeb.Core.Data;
using RxWeb.Core.Security;
using RxWeb.Core.Annotations;
using RxWeb.Core;
using AmazonApp.UnitOfWork.DbEntityAudit;
using AmazonApp.BoundedContext.Main;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Domain.UserModule;
            using AmazonApp.Domain.PaymentModule;
            using AmazonApp.Domain.PrimeMusicModule;
            using AmazonApp.Domain.ProductModule;
            #endregion Namespace







namespace AmazonApp.Api.Bootstrap
{
    public static class ScopedExtension
    {

        public static void AddScopedService(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddScoped<IRepositoryProvider, RepositoryProvider>();
            serviceCollection.AddScoped<ITokenAuthorizer, TokenAuthorizer>();
            serviceCollection.AddScoped<IModelValidation, ModelValidation>();
            serviceCollection.AddScoped<IAuditLog, AuditLog>();
            serviceCollection.AddScoped<IApplicationTokenProvider, ApplicationTokenProvider>();
            serviceCollection.AddScoped(typeof(IDbContextManager<>), typeof(DbContextManager<>));

            #region ContextService

            serviceCollection.AddScoped<ILoginContext, LoginContext>();
            serviceCollection.AddScoped<ILoginUow, LoginUow>();
                        serviceCollection.AddScoped<IUserContext, UserContext>();
            serviceCollection.AddScoped<IUserUow, UserUow>();
                        serviceCollection.AddScoped<ISellerContext, SellerContext>();
            serviceCollection.AddScoped<ISellerUow, SellerUow>();
                        serviceCollection.AddScoped<ICartContext, CartContext>();
            serviceCollection.AddScoped<ICartUow, CartUow>();
                        serviceCollection.AddScoped<IAdvertisementContext, AdvertisementContext>();
            serviceCollection.AddScoped<IAdvertisementUow, AdvertisementUow>();
                        serviceCollection.AddScoped<IProductContext, ProductContext>();
            serviceCollection.AddScoped<IProductUow, ProductUow>();
                        serviceCollection.AddScoped<IPaymentContext, PaymentContext>();
            serviceCollection.AddScoped<IPaymentUow, PaymentUow>();
                        serviceCollection.AddScoped<IOrderContext, OrderContext>();
            serviceCollection.AddScoped<IOrderUow, OrderUow>();
                        serviceCollection.AddScoped<IPrimeMusicContext, PrimeMusicContext>();
            serviceCollection.AddScoped<IPrimeMusicUow, PrimeMusicUow>();
            #endregion ContextService











            #region DomainService

            
            serviceCollection.AddScoped<IOtpDomain, OtpDomain>();
            
            
            
            serviceCollection.AddScoped<IAppUserDomain, AppUserDomain>();
            
            serviceCollection.AddScoped<ITransactionDomain, TransactionDomain>();
            
            serviceCollection.AddScoped<IPrimeMusicDomain, PrimeMusicDomain>();
            
           
            
            serviceCollection.AddScoped<IBrandDomain, BrandDomain>();
            
            serviceCollection.AddScoped<ISizeDomain, SizeDomain>();
            
            serviceCollection.AddScoped<IColorDomain, ColorDomain>();
            
            serviceCollection.AddScoped<IMaterialDomain, MaterialDomain>();
            
            serviceCollection.AddScoped<ILanguageDomain, LanguageDomain>();
            
            serviceCollection.AddScoped<IDiscountDomain, DiscountDomain>();
            
            serviceCollection.AddScoped<IPromoCodeDomain, PromoCodeDomain>();
            #endregion DomainService















        }
    }
}




