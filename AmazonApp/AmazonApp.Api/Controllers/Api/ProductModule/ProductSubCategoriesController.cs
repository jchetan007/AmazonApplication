using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.ProductModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.ProductModule
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/[controller]")]
	
	public class ProductSubCategoriesController : BaseDomainController<ProductSubCategory, ProductSubCategory>

    {
        public ProductSubCategoriesController(IProductSubCategoryDomain domain):base(domain) {}

    }
}
