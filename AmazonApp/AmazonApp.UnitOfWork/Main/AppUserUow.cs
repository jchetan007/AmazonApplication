using RxWeb.Core.Data;
using AmazonApp.BoundedContext.Main;

namespace AmazonApp.UnitOfWork.Main
{
    public class AppUserUow : BaseUow, IAppUserUow
    {
        public AppUserUow(IAppUserContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IAppUserUow : ICoreUnitOfWork { }
}


