using RxWeb.Core.Data;
using AmazonApp.BoundedContext.Main;

namespace AmazonApp.UnitOfWork.Main
{
    public class VerifyOtpUow : BaseUow, IVerifyOtpUow
    {
        public VerifyOtpUow(IVerifyOtpContext context, IRepositoryProvider repositoryProvider) : base(context, repositoryProvider) { }
    }

    public interface IVerifyOtpUow : ICoreUnitOfWork { }
}


