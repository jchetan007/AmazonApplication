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
    public class SizeDomain : ISizeDomain
    {
        public SizeDomain(IProductUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(Size parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(Size parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Size entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Size parameters)
        {
            await DbContextManager.BeginTransactionAsync();

            var spParameters = new SqlParameter[1];
            spParameters[0] = new SqlParameter() { ParameterName = "SizeType", Value = parameters.SizeType };


            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spFilterSizes ", spParameters);
            try
            {
                await DbContextManager.CommitAsync();
            }
            catch (Exception e)
            {
                DbContextManager.RollbackTransaction();
            }
        }

        public HashSet<string> UpdateValidation(Size entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Size entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Size parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Size parameters)
        {
            throw new NotImplementedException();
        }

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface ISizeDomain : ICoreDomain<Size, Size> { }
}
