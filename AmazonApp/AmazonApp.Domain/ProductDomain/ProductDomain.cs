using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.ProductModule
{
    public class ProductDomain : IProductDomain
    {
        public ProductDomain(IProductUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(Product parameters)
        {
            return await Uow.Repository<Product>().AllAsync();
        }

        public async Task<object> GetBy(Product parameters)
        {
            return await Uow.Repository<Product>().FindByAsync(t => t.ProductId == parameters.ProductId);
        }
        

        public HashSet<string> AddValidation(Product entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Product entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Product entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Product entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Product parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Product parameters)
        {
            throw new NotImplementedException();
        }

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IProductDomain : ICoreDomain<Product, Product> { }
}
