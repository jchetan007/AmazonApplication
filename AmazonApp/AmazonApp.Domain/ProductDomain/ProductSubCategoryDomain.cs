using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.ProductModule
{
    public class ProductSubCategoryDomain : IProductSubCategoryDomain
    {
        public ProductSubCategoryDomain(IProductUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(ProductSubCategory parameters)
        {
            return await Uow.Repository<ProductSubCategory>().AllAsync();
        }

        public async Task<object> GetBy(ProductSubCategory parameters)
        {
            return await Uow.Repository<Product>().FindByAsync(t => t.ProductSubCategoryId == parameters.ProductSubCategoryId);
        }
        

        public HashSet<string> AddValidation(ProductSubCategory entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(ProductSubCategory entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(ProductSubCategory entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(ProductSubCategory entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(ProductSubCategory parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(ProductSubCategory parameters)
        {
            throw new NotImplementedException();
        }

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IProductSubCategoryDomain : ICoreDomain<ProductSubCategory, ProductSubCategory> { }
}
