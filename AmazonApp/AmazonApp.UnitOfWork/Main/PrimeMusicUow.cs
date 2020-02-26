using RxWeb.Core.Data;
using AmazonApp.BoundedContext.Main;

namespace AmazonApp.UnitOfWork.Main
{
    public class PrimeMusicUow : BaseUow, IPrimeMusicUow
    {
        public PrimeMusicUow(IPrimeMusicContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IPrimeMusicUow : ICoreUnitOfWork { }
}


