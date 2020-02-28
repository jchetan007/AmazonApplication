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
    public class BrandDomain : IBrandDomain
    {
        public BrandDomain(IProductUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
            DbContextManager = dbContextManager;
        }

        public async Task<object> GetAsync(Brand parameters)
        {
            return await Uow.Repository<Brand>().AllAsync();
            
            
            //var spParameters = new SqlParameter[1];
            //spParameters[0] = new SqlParameter() { ParameterName = "BrandName", Value = parameters.BrandName };
            //throw new NotImplementedException();
            //await DbContextManager.StoreProc<StoreProcResult>("[dbo].spFilterBrands ", spParameters);

        }

        public async Task<object> GetBy(Brand parameters)
        {
            return await Uow.Repository<Brand>().FindByAsync(t => t.BrandId == parameters.BrandId);
            //throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Brand entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Brand entity)
        {

            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();

        }

        public HashSet<string> UpdateValidation(Brand entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Brand entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Brand parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Brand parameters)
        {
            throw new NotImplementedException();
        }

        

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface IBrandDomain : ICoreDomain<Brand, Brand> { }
}
