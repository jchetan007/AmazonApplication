using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.PaymentModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace AmazonApp.Api.Controllers.PaymentModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class PromoCodesController : BaseDomainController<PromoCode, PromoCode>

    {
        public PromoCodesController(IPromoCodeDomain domain):base(domain) {}

    }
}
