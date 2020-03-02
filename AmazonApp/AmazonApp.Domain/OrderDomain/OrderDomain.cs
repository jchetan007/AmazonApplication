using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.OrderModule
{
    public class OrderDomain : IOrderDomain
    {
        public OrderDomain(IOrderUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(Order parameters)
        {
            return await Uow.Repository<Order>().AllAsync();
        }

        public async Task<object> GetBy(Order parameters)
        {
            return await Uow.Repository<Order>().FindByAsync(t => t.OrderId == parameters.OrderId);
        }
        

        public HashSet<string> AddValidation(Order entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Order entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Order entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Order entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Order parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Order parameters)
        {
            throw new NotImplementedException();
        }

        public IOrderUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IOrderDomain : ICoreDomain<Order, Order> { }
}
