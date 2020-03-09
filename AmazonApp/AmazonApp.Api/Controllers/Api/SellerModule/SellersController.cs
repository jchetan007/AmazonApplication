using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.SellerModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.SellerModule
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/[controller]")]
	
	public class SellersController : BaseDomainController<Seller, Seller>

    {
        public SellersController(ISellerDomain domain):base(domain) {}

    }
}
