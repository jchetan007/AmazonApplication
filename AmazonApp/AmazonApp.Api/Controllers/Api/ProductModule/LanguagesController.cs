using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.ProductModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace AmazonApp.Api.Controllers.ProductModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class LanguagesController : BaseDomainController<Language, Language>

    {
        public LanguagesController(ILanguageDomain domain):base(domain) {}

    }
}
