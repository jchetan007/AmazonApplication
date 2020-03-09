using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.ProductModule
{
    public class vProductDomain : IvProductDomain
    {
        public vProductDomain(IProductUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(vProduct parameters)
        {
            return await Uow.Repository<vProduct>().AllAsync();
        }

        public async Task<object> GetBy(vProduct parameters)
        {
            return await Uow.Repository<vProduct>().FindByAsync(t => t.ProductId == parameters.ProductId);
        }
        

        public HashSet<string> AddValidation(vProduct entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(vProduct entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(vProduct entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(vProduct entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(vProduct parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(vProduct parameters)
        {
            throw new NotImplementedException();
        }

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IvProductDomain : ICoreDomain<vProduct, vProduct> { }
}
