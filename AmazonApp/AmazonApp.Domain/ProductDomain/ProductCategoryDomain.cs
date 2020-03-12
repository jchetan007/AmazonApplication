using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.ProductModule
{
    public class ProductCategoryDomain : IProductCategoryDomain
    {
        public ProductCategoryDomain(IProductUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(ProductCategory parameters)
        {
            return await Uow.Repository<ProductCategory>().AllAsync();
        }

        public async Task<object> GetBy(ProductCategory parameters)
        {
            return await Uow.Repository<ProductSubCategory>().FindByAsync(t => t.ProductCategoryId == parameters.ProductCategoryId);
        }
        

        public HashSet<string> AddValidation(ProductCategory entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(ProductCategory entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(ProductCategory entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(ProductCategory entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(ProductCategory parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(ProductCategory parameters)
        {
            throw new NotImplementedException();
        }

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IProductCategoryDomain : ICoreDomain<ProductCategory, ProductCategory> { }
}
