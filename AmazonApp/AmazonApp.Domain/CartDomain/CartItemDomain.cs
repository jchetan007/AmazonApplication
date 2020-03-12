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

namespace AmazonApp.Domain.CartModule
{
    public class CartItemDomain : ICartItemDomain
    {
        public CartItemDomain(ICartUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
            DbContextManager = dbContextManager;
        }

        public async Task<object> GetAsync(CartItem parameters)
        {
            return await Uow.Repository<CartItem>().AllAsync();
        }

        public async Task<object> GetBy(CartItem parameters)
        {
            return await Uow.Repository<CartItem>().FindByAsync(t => t.AppUserId == parameters.AppUserId);
        }
        

        public HashSet<string> AddValidation(CartItem entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(CartItem entity)
        {
            var spParameters = new SqlParameter[4];
            spParameters[0] = new SqlParameter() { ParameterName = "ProductId", Value = entity.ProductId };
            spParameters[1] = new SqlParameter() { ParameterName = "AppUserId", Value = entity.AppUserId };
            spParameters[2] = new SqlParameter() { ParameterName = "ProductQuantity", Value = entity.ProductQuantity };
            spParameters[3] = new SqlParameter() { ParameterName = "TotalPrice", Value = entity.TotalPrice };

            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spCartitems ", spParameters);
            await DbContextManager.CommitAsync();
        }

        public HashSet<string> UpdateValidation(CartItem entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(CartItem entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(CartItem parameters)
        {
            return ValidationMessages;
        }

        public async Task DeleteAsync(CartItem parameters)
        {
            var item = await Uow.Repository<CartItem>().FindByAsync(t =>t.ProductId == parameters.ProductId);
            await Uow.RegisterDeletedAsync(item);
            await Uow.CommitAsync();
            //throw new NotImplementedException();
        }

        public ICartUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface ICartItemDomain : ICoreDomain<CartItem, CartItem> { }
}
