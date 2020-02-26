using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;
using RxWeb.Core.Data;
using AmazonApp.Models.ViewModels;
using Microsoft.Data.SqlClient;
using AmazonApp.BoundedContext.SqlContext;

namespace AmazonApp.Domain.PaymentModule
{
    public class PromoCodeDomain : IPromoCodeDomain
    {
        public PromoCodeDomain(IPaymentUow uow ,IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(PromoCode parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(PromoCode parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(PromoCode entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(PromoCode parameters)
        {
            await DbContextManager.BeginTransactionAsync();

            var spParameters = new SqlParameter[2];
            spParameters[0] = new SqlParameter() { ParameterName = "Amount", Value = parameters.Amount };
            spParameters[1] = new SqlParameter() { ParameterName = "PromoCodeName", Value = parameters.PromoCodeName };

            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spPromoCodes ", spParameters);
            try
            {
                await DbContextManager.CommitAsync();
            }
            catch (Exception e)
            {
                DbContextManager.RollbackTransaction();
            }
        }

        public HashSet<string> UpdateValidation(PromoCode entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(PromoCode entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(PromoCode parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(PromoCode parameters)
        {
            throw new NotImplementedException();
        }

        public IPaymentUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface IPromoCodeDomain : ICoreDomain<PromoCode, PromoCode> { }
}
