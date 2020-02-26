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
    public class MaterialDomain : IMaterialDomain
    {
        public MaterialDomain(IProductUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(Material parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(Material parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Material entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Material parameters)
        {
            await DbContextManager.BeginTransactionAsync();

            var spParameters = new SqlParameter[1];
            spParameters[0] = new SqlParameter() { ParameterName = "MaterialType", Value = parameters.MaterialType };


            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spFilterMaterials ", spParameters);
            try
            {
                await DbContextManager.CommitAsync();
            }
            catch (Exception e)
            {
                DbContextManager.RollbackTransaction();
            }
        }

        public HashSet<string> UpdateValidation(Material entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Material entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Material parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Material parameters)
        {
            throw new NotImplementedException();
        }

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface IMaterialDomain : ICoreDomain<Material, Material> { }
}
