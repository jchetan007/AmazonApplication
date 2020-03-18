using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.CartModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.CartModule
{
   
    [ApiController]
    [Route("api/[controller]")]
	
	public class vCartItemsController : BaseDomainController<vCartItem, vCartItem>

    {
        public vCartItemsController(IvCartItemDomain domain):base(domain) {}

    }
}
