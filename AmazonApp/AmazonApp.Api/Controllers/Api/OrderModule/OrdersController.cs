using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.OrderModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.OrderModule
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/[controller]")]
	
	public class OrdersController : BaseDomainController<Order, Order>

    {
        public OrdersController(IOrderDomain domain):base(domain) {}

    }
}
