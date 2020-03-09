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
	
	public class VerifyPromoCodesController : BaseDomainController<PromoCode, PromoCode>

    {
        public VerifyPromoCodesController(IVerifyPromoCodeDomain domain):base(domain) {}

    }
}
