using RxWeb.Core.Data;
using AmazonApp.BoundedContext.Main;

namespace AmazonApp.UnitOfWork.Main
{
    public class AdvertisementUow : BaseUow, IAdvertisementUow
    {
        public AdvertisementUow(IAdvertisementContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IAdvertisementUow : ICoreUnitOfWork { }
}


