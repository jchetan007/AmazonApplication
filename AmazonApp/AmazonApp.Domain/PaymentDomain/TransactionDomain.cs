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
    public class TransactionDomain : ITransactionDomain
    {
        public TransactionDomain(IPaymentUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
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
            await DbContextManager.BeginTransactionAsync();

            var spParameters = new SqlParameter[5];
            spParameters[0] = new SqlParameter() { ParameterName = "amount", Value = parameters.Amount };
            spParameters[1] = new SqlParameter() { ParameterName = "appUserId", Value = parameters.AppUserId };
            spParameters[2] = new SqlParameter() { ParameterName = "sellerId", Value = parameters.SellerId };
            spParameters[3] = new SqlParameter() { ParameterName = "transactionDate", Value = parameters.TransactionDate };
            spParameters[4] = new SqlParameter() { ParameterName = "applicationObjectId", Value = parameters.ApplicationObjectId };
          
            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spTransactions ", spParameters);
            try
            {
                await DbContextManager.CommitAsync();
            }
            catch (Exception e)
            {
                DbContextManager.RollbackTransaction();
            }
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

    public interface ITransactionDomain : ICoreDomain<Transaction, Transaction> { }
}
