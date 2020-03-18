using AmazonApp.Infrastructure.Singleton;
using AmazonApp.Models.Main;
using AmazonApp.Models.ViewModels;
using AmazonApp.UnitOfWork.Main;
using Microsoft.AspNetCore.Http;
using RxWeb.Core.Security;
using System;
using System.Security.Claims;
using System.Threading.Tasks;

namespace AmazonApp.Infrastructure.Security
{
    public class ApplicationTokenProvider : IApplicationTokenProvider
    {
        private ILoginUow LoginUow { get; set; }
        private UserAccessConfigInfo UserAccessConfig { get; set; }
        private IJwtTokenProvider TokenProvider { get; set; }

        private IUserClaim UserClaim { get; set; }

        private IHttpContextAccessor ContextAccessor { get; set; }

        public ApplicationTokenProvider(IJwtTokenProvider tokenProvider, UserAccessConfigInfo userAccessConfig, ILoginUow loginUow, IUserClaim userClaim, IHttpContextAccessor contextAccessor)
        {
            TokenProvider = tokenProvider;
            UserAccessConfig = userAccessConfig;
            LoginUow = loginUow;
            UserClaim = userClaim;
            ContextAccessor = contextAccessor;
        }
        public async Task<string> GetTokenAsync(AppUser user)
        {
            var expirationTime = user.AppUserId == 0 ? DateTime.UtcNow.AddDays(1) : DateTime.UtcNow.AddDays(1);
            var token = TokenProvider.WriteToken(new[]{
                new Claim(
                    ClaimTypes.NameIdentifier, user.AppUserId.ToString()),
                new Claim(ClaimTypes.Anonymous, (user.AppUserId == 0).ToString()),
                    //new Claim(ClaimTypes.Locality,user.LanguageCode),
                    //new Claim(CustomClaimTypes.TimeZone,user.ApplicationTimeZoneName)
                    }, "Web", "User", expirationTime);
            if (user.AppUserId != 0) await UserAccessConfig.SaveTokenAsync(user.AppUserId, "web", token, LoginUow);
            this.AddCookie(user, token.Key);
            return token.Value;
        }

        public async Task<string> RefereshTokenAsync(AppUser user, UserConfig userConfig)
        {
            if (!string.IsNullOrEmpty(userConfig.LanguageCode))
            {
                var userRecord = await LoginUow.Repository<User>().SingleAsync(t => t.UserId == user.AppUserId);
                userRecord.LanguageCode = userConfig.LanguageCode;
                await LoginUow.RegisterDirtyAsync<User>(userRecord);
                await LoginUow.CommitAsync();
            }
            await UserAccessConfig.RemoveTokenAsync(user.AppUserId, userConfig.AudienceType, LoginUow);
            return await this.GetTokenAsync(user);
        }

        public async Task RemoveTokenAsync(UserConfig userConfig)
        {
            this.RemoveCookie();
            await UserAccessConfig.RemoveTokenAsync(UserClaim.UserId, userConfig.AudienceType, LoginUow);
        }


        private void AddCookie(AppUser user, string value)
        {
            var cookieName = user.AppUserId == 0 ? ANONYMOUS : REQUEST_IDENTITY;
            if (cookieName == REQUEST_IDENTITY && ContextAccessor.HttpContext.Request.Cookies.ContainsKey(ANONYMOUS))
                ContextAccessor.HttpContext.Response.Cookies.Delete(ANONYMOUS);
            ContextAccessor.HttpContext.Response.Cookies.Append(cookieName, value);
        }
        private void RemoveCookie() => ContextAccessor.HttpContext.Response.Cookies.Delete(REQUEST_IDENTITY);

        private const string REQUEST_IDENTITY = "request_identity";
        private const string ANONYMOUS = "anonymous";
    }

    public interface IApplicationTokenProvider
    {
        Task<string> GetTokenAsync(AppUser user);

        Task<string> RefereshTokenAsync(AppUser user, UserConfig userConfig);

        Task RemoveTokenAsync(UserConfig userConfig);
    }
}



