using RxWeb.Core.Data;
using AmazonApp.BoundedContext.Main;

namespace AmazonApp.UnitOfWork.Main
{
    public class ProductUow : BaseUow, IProductUow
    {
        public ProductUow(IProductContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IProductUow : ICoreUnitOfWork { }
}


