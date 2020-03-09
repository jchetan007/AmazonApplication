using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.PrimeMusicModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.PrimeMusicModule
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/[controller]")]
	
	public class MusicSubCategoriesController : BaseDomainController<MusicSubCategory, MusicSubCategory>

    {
        public MusicSubCategoriesController(IMusicSubCategoryDomain domain):base(domain) {}

    }
}
