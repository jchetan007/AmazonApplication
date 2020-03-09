using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.CartModule
{
    public class CartItemDomain : ICartItemDomain
    {
        public CartItemDomain(ICartUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(CartItem parameters)
        {
            return await Uow.Repository<CartItem>().AllAsync();
        }

        public async Task<object> GetBy(CartItem parameters)
        {
            return await Uow.Repository<CartItem>().FindByAsync(t => t.CartItemId == parameters.CartItemId);
        }
        

        public HashSet<string> AddValidation(CartItem entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(CartItem entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
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

        public Task DeleteAsync(CartItem parameters)
        {
            throw new NotImplementedException();
        }

        public ICartUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface ICartItemDomain : ICoreDomain<CartItem, CartItem> { }
}
