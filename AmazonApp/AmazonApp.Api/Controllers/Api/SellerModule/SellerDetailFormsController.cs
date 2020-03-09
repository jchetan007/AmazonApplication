using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.SellerModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using AmazonApp.Models.ViewModels;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.SellerModule
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/[controller]")]
	
	public class SellerDetailFormsController : BaseDomainController<SellerDetailForm, SellerDetailForm>

    {
        public SellerDetailFormsController(ISellerDetailFormDomain domain):base(domain) {}

    }
}
