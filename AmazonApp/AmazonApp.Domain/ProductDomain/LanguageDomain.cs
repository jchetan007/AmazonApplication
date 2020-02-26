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
    public class LanguageDomain : ILanguageDomain
    {
        public LanguageDomain(IProductUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(Language parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(Language parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Language entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Language parameters)
        {
            await DbContextManager.BeginTransactionAsync();

            var spParameters = new SqlParameter[1];
            spParameters[0] = new SqlParameter() { ParameterName = "LanguageName", Value = parameters.LanguageName };


            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spFilterLanguages ", spParameters);
            try
            {
                await DbContextManager.CommitAsync();
            }
            catch (Exception e)
            {
                DbContextManager.RollbackTransaction();
            }
        }

        public HashSet<string> UpdateValidation(Language entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Language entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Language parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Language parameters)
        {
            throw new NotImplementedException();
        }

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface ILanguageDomain : ICoreDomain<Language, Language> { }
}
