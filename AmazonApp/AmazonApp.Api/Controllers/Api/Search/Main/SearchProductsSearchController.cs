using System.Collections.Generic;
//using System.Data.SqlClient;
using Microsoft.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RxWeb.Core.Security;
using RxWeb.Core.Data;
//using RxWeb.Core.Common.Binder;
using AmazonApp.Models.ViewModels;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Api.Controllers.Module
{
    [ApiController]
	[Route("api/[controller]")]
    public class SearchSearchProductsController : ControllerBase
    {
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
        public SearchSearchProductsController(IDbContextManager<MainSqlDbContext> dbContextManager) {
            DbContextManager = dbContextManager;
        }

		[HttpPost]
        public async Task<IActionResult> Post([FromBody]Dictionary<string,string> searchParams)
        {
            var spParameters = new SqlParameter[1];
            spParameters[0] = new SqlParameter() { ParameterName = "Product", Value = searchParams["Product"] };
            //spParameters[1] = new SqlParameter() { ParameterName = "UserId", Value = UserClaim.UserId };
            var result = await DbContextManager.StoreProc<StoreProcResult>("[dbo].spSearchProducts", spParameters);
            return Ok(result.SingleOrDefault()?.Result);
        }
    }
}
