using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;
using RxWeb.Core.Data;
using AmazonApp.BoundedContext.SqlContext;
using Microsoft.Data.SqlClient;
using AmazonApp.Models.ViewModels;

namespace AmazonApp.Domain.PaymentModule
{
    public class BuyNowTransactionDomain : IBuyNowTransactionDomain
    {
        public BuyNowTransactionDomain(IPaymentUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
            DbContextManager = dbContextManager;
        }

        public Task<object> GetAsync(Transaction parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(Transaction parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Transaction entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Transaction parameters)
        {
            var spParameters = new SqlParameter[4];

            spParameters[0] = new SqlParameter() { ParameterName = "AppUserId", Value = parameters.AppUserId };
            spParameters[1] = new SqlParameter() { ParameterName = "SellerDetailId", Value = parameters.SellerDetailId };
            spParameters[2] = new SqlParameter() { ParameterName = "Amount", Value = parameters.Amount };
            spParameters[3] = new SqlParameter() { ParameterName = "TransactionDate", Value = parameters.TransactionDate };

            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spBuyNowTransactions ", spParameters);
            await DbContextManager.CommitAsync();
            //await Uow.RegisterNewAsync(entity);
            //await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Transaction entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Transaction entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Transaction parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Transaction parameters)
        {
            throw new NotImplementedException();
        }

        public IPaymentUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface IBuyNowTransactionDomain : ICoreDomain<Transaction, Transaction> { }
}
