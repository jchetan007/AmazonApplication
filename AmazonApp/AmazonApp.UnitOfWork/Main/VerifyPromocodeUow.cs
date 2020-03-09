using RxWeb.Core.Data;
using AmazonApp.BoundedContext.Main;

namespace AmazonApp.UnitOfWork.Main
{
    public class VerifyPromocodeUow : BaseUow, IVerifyPromocodeUow
    {
        public VerifyPromocodeUow(IVerifyPromocodeContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IVerifyPromocodeUow : ICoreUnitOfWork { }
}


