using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using AmazonApp.Infrastructure.Security;
using AmazonApp.Models.Main;
using AmazonApp.Models.ViewModels;
using AmazonApp.UnitOfWork.Main;
using RxWeb.Core.Security.Cryptography;
using System;
using System.Linq;
using System.Threading.Tasks;
using RxWeb.Core.Security.Filters;

namespace AmazonApp.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthenticationController : ControllerBase
    {
        private ILoginUow LoginUow { get; set; }
        private IApplicationTokenProvider ApplicationTokenProvider { get; set; }
        private IPasswordHash PasswordHash { get; set; }

        public AuthenticationController(ILoginUow loginUow, IApplicationTokenProvider tokenProvider, IPasswordHash passwordHash)
        {
            this.LoginUow = loginUow;
            ApplicationTokenProvider = tokenProvider;
            PasswordHash = passwordHash;
        }

        [HttpGet]
        [AllowAnonymous]
        [AllowRequest(MaxRequestCountPerIp = 100)]
        public async Task<IActionResult> Get()
        {
            var token = await ApplicationTokenProvider.GetTokenAsync(new AppUser { AppUserId = 0});
            return Ok(token);
        }

        [HttpPost]
        //[AllowAnonymousUser]
        [AllowAnonymous]
        public async Task<IActionResult> Post(AuthenticationModel authentication)
        {
            var user = await LoginUow.Repository<AppUser>().SingleOrDefaultAsync(t => t.MobileNumber == authentication.UserName );
            if (user != null && PasswordHash.VerifySignature(authentication.Password, user.Password, user.Salt))
            {
                var token = await ApplicationTokenProvider.GetTokenAsync(user);
                return Ok(token);
            }
            else
                return BadRequest();
        }
    }
}

