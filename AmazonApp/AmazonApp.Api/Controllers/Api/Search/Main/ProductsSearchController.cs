using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RxWeb.Core.Security;
using RxWeb.Core.Data;

using AmazonApp.Models.ViewModels;
using AmazonApp.BoundedContext.SqlContext;
namespace AmazonApp.Api.Controllers.Module
{
    [ApiController]
	[Route("api/[controller]")]
    public class SearchProductsController : ControllerBase
    {
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
        public SearchProductsController(IDbContextManager<MainSqlDbContext> dbContextManager) {
            DbContextManager = dbContextManager;
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody]Dictionary<string, string> searchParams)
        {
            var spParameters = new SqlParameter[1];
            spParameters[0] = new SqlParameter() { ParameterName = "Product", Value = searchParams["Product"] };
            var result = await DbContextManager.StoreProc<StoreProcResult>("EXEC [dbo].spSearchProducts @Product", spParameters);
            return Ok(result.SingleOrDefault()?.Result);
        }

    }
}
