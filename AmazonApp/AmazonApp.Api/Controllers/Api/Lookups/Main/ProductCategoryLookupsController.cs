using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.ProductModule
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/[controller]")]
	
	public class ProductCategoryLookupsController : BaseLookupController

    {
        public ProductCategoryLookupsController(IProductUow uow):base(uow) {}

        #region Lookups
        [HttpGet("ProductCategoryLookups")]
        public IQueryable<vProductCategoryLookup> ProductCategoryLookups()
        {
            return Uow.Repository<vProductCategoryLookup>().Queryable();
        }
        #endregion Lookups
    }
}
