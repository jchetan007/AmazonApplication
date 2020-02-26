using RxWeb.Core.Data;
using AmazonApp.BoundedContext.Main;

namespace AmazonApp.UnitOfWork.Main
{
    public class CartUow : BaseUow, ICartUow
    {
        public CartUow(ICartContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface ICartUow : ICoreUnitOfWork { }
}


