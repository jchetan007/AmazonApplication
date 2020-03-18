using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.PrimeMusicModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Api.Controllers.PrimeMusicModule
{
   
    [ApiController]
    [Route("api/[controller]")]
	
	public class vMusicsController : BaseDomainController<vMusic, vMusic>

    {
        public vMusicsController(IvMusicDomain domain):base(domain) {}

    }
}
