using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.UserModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace AmazonApp.Api.Controllers.UserModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class OtpsController : BaseDomainController<Otp,Otp>

    {
        public OtpsController(IOtpDomain domain):base(domain) {}

    }
}
