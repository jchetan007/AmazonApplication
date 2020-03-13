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

        public async Task<object> GetAsync(Transaction parameters)
        {
            return await Uow.Repository<Transaction>().AllAsync();
            //throw new NotImplementedException();
        }

        public async Task<object> GetBy(Transaction parameters)
        {
            return await Uow.Repository<Order>().FindByAsync(t => t.TransactionId == parameters.TransactionId);
            //throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Transaction entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Transaction parameters)
        {
            

            var spParameters = new SqlParameter[3];
           
            spParameters[0] = new SqlParameter() { ParameterName = "AppUserId", Value = parameters.AppUserId };
            spParameters[1] = new SqlParameter() { ParameterName = "SellerDetailId", Value = parameters.SellerDetailId };
            spParameters[2] = new SqlParameter() { ParameterName = "TransactionDate", Value = parameters.TransactionDate };
            
            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spTransactions ", spParameters);
            await DbContextManager.CommitAsync();
            
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
