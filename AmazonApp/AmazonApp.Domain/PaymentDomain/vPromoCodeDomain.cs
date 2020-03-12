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
    public class vPromoCodeDomain : IvPromoCodeDomain
    {
        public vPromoCodeDomain(IPaymentUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
            DbContextManager = dbContextManager;
        }

        public Task<object> GetAsync(vPromoCode parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(vPromoCode parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(vPromoCode entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(vPromoCode entity)
        {
            var spParameters = new SqlParameter[2];
            spParameters[0] = new SqlParameter() { ParameterName = "PromoCodeName", Value = entity.PromoCodeName };
            spParameters[1] = new SqlParameter() { ParameterName = "AppUserId", Value = entity.AppUserId };

            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spPromoCodes ", spParameters);
            await DbContextManager.CommitAsync();
        }

        public HashSet<string> UpdateValidation(vPromoCode entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(vPromoCode entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(vPromoCode parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(vPromoCode parameters)
        {
            throw new NotImplementedException();
        }

        public IPaymentUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface IvPromoCodeDomain : ICoreDomain<vPromoCode, vPromoCode> { }
}
