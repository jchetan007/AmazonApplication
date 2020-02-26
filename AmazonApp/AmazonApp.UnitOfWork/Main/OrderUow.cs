using RxWeb.Core.Data;
using AmazonApp.BoundedContext.Main;

namespace AmazonApp.UnitOfWork.Main
{
    public class OrderUow : BaseUow, IOrderUow
    {
        public OrderUow(IOrderContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IOrderUow : ICoreUnitOfWork { }
}


