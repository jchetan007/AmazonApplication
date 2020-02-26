using Microsoft.AspNetCore.Mvc;
using System.Linq;
using AmazonApp.Domain.PaymentModule;
using AmazonApp.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace AmazonApp.Api.Controllers.PaymentModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class TransactionsController : BaseDomainController<Transaction,Transaction>

    {
        public TransactionsController(ITransactionDomain domain):base(domain) {}

    }
}
