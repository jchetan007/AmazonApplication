using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace AmazonApp.Api.Controllers.ProductModule
{
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
