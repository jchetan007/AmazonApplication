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
using Microsoft.AspNetCore.Authorization;

namespace AmazonApp.Domain.CartModule
{
    
    public class vCartItemDomain : IvCartItemDomain
        
    {
        public vCartItemDomain(ICartUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
            DbContextManager = dbContextManager;

        }
        

        public async Task<object> GetAsync(vCartItem parameters)
        {
            return await Uow.Repository<vCartItem>().AllAsync();
            //throw new NotImplementedException();
        }

        public async Task<object> GetBy(vCartItem parameters)
        {
            return await Uow.Repository<vCartItem>().FindByAsync(t => t.AppUserId == parameters.AppUserId);
            //throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(vCartItem entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(vCartItem entity)
        {
            var spParameters = new SqlParameter[1];
            spParameters[0] = new SqlParameter() { ParameterName = "ProductId", Value = entity.ProductId };
           
            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spCartRemove ", spParameters);
            await DbContextManager.CommitAsync();

            //await Uow.RegisterNewAsync(entity);
            //await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(vCartItem entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(vCartItem entity)
        {
            
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(vCartItem parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(vCartItem parameters)
        {
            throw new NotImplementedException();
        }

        public ICartUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface IvCartItemDomain : ICoreDomain<vCartItem, vCartItem> { }
}
