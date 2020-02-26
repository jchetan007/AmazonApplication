using RxWeb.Core.Data;
using AmazonApp.BoundedContext.Main;

namespace AmazonApp.UnitOfWork.Main
{
    public class SellerUow : BaseUow, ISellerUow
    {
        public SellerUow(ISellerContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface ISellerUow : ICoreUnitOfWork { }
}


