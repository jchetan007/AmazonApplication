using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.CartModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace AmazonApp.Api.Controllers.CartModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class CartItemsController : BaseDomainController<CartItem, CartItem>

    {
        public CartItemsController(ICartItemDomain domain):base(domain) {}

    }
}
