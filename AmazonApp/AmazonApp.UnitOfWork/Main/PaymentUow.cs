using RxWeb.Core.Data;
using AmazonApp.BoundedContext.Main;

namespace AmazonApp.UnitOfWork.Main
{
    public class PaymentUow : BaseUow, IPaymentUow
    {
        public PaymentUow(IPaymentContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IPaymentUow : ICoreUnitOfWork { }
}


