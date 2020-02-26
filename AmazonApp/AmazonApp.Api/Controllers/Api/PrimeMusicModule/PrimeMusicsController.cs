using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.PrimeMusicModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace AmazonApp.Api.Controllers.PrimeMusicModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class PrimeMusicsController : BaseDomainController<PrimeMusic, PrimeMusic>

    {
        public PrimeMusicsController(IPrimeMusicDomain domain):base(domain) {}

    }
}
