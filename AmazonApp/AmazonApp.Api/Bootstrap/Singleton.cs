using Microsoft.Extensions.DependencyInjection;
using AmazonApp.Infrastructure.Singleton;
using AmazonApp.BoundedContext.Singleton;
using RxWeb.Core.Data;

namespace AmazonApp.Api.Bootstrap
{
    public static class Singleton
    {
        public static void AddSingletonService(this IServiceCollection serviceCollection)
        {
            #region Singleton
            serviceCollection.AddSingleton<ITenantDbConnectionInfo, TenantDbConnectionInfo>();
            serviceCollection.AddSingleton(typeof(UserAccessConfigInfo));
            #endregion Singleton
        }

    }
}




