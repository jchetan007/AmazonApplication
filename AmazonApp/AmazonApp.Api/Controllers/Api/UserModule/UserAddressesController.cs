using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.UserModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.UserModule
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/[controller]")]
	
	public class UserAddressesController : BaseDomainController<UserAddress, UserAddress>

    {
        public UserAddressesController(IUserAddressDomain domain):base(domain) {}

    }
}
