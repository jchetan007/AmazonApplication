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

namespace AmazonApp.Domain.ProductModule
{
    public class DiscountDomain : IDiscountDomain
    {
        public DiscountDomain(IProductUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(Discount parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(Discount parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Discount entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Discount parameters)
        {
            await DbContextManager.BeginTransactionAsync();

            var spParameters = new SqlParameter[2];
            spParameters[0] = new SqlParameter() { ParameterName = "DiscountPrice", Value = parameters.DiscountPrice };
            spParameters[1] = new SqlParameter() { ParameterName = "ProductCategoryId", Value = parameters.ProductCategoryId };
            


            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spDiscounts ", spParameters);
            try
            {
                await DbContextManager.CommitAsync();
            }
            catch (Exception e)
            {
                DbContextManager.RollbackTransaction();
            }
        }

        public HashSet<string> UpdateValidation(Discount entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Discount entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Discount parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Discount parameters)
        {
            throw new NotImplementedException();
        }

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface IDiscountDomain : ICoreDomain<Discount, Discount> { }
}
