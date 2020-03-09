using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.ProductModule
{
    public class ProductMainCategoryDomain : IProductMainCategoryDomain
    {
        public ProductMainCategoryDomain(IProductUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(ProductMainCategory parameters)
        {
            return await Uow.Repository<ProductMainCategory>().AllAsync();
        }

        public async Task<object> GetBy(ProductMainCategory parameters)
        {
            return await Uow.Repository<ProductMainCategory>().FindByAsync(t => t.ProductMainCategoryId == parameters.ProductMainCategoryId);
        }
        

        public HashSet<string> AddValidation(ProductMainCategory entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(ProductMainCategory entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(ProductMainCategory entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(ProductMainCategory entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(ProductMainCategory parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(ProductMainCategory parameters)
        {
            throw new NotImplementedException();
        }

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IProductMainCategoryDomain : ICoreDomain<ProductMainCategory, ProductMainCategory> { }
}
