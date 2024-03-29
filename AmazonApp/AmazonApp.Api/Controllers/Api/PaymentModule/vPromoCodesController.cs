using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.PaymentModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.PaymentModule
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/[controller]")]
	
	public class vPromoCodesController : BaseDomainController<vPromoCode, vPromoCode>

    {
        public vPromoCodesController(IvPromoCodeDomain domain):base(domain) {}

    }
}
