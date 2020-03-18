using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.PaymentModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.PaymentModule
{
   
    [ApiController]
    [Route("api/[controller]")]
	
	public class CardsController : BaseDomainController<Card, Card>

    {
        public CardsController(ICardDomain domain):base(domain) {}

    }
}
