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
	
	public class MusicsController : BaseDomainController<Music, Music>

    {
        public MusicsController(IMusicDomain domain):base(domain) {}

    }
}
