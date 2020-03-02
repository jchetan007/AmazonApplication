using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.SellerModule
{
    public class SellerDomain : ISellerDomain
    {
        public SellerDomain(ISellerUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(Seller parameters)
        {
            return await Uow.Repository<Seller>().AllAsync();
        }

        public async Task<object> GetBy(Seller parameters)
        {
            return await Uow.Repository<Seller>().FindByAsync(t => t.SellerId == parameters.SellerId );
        }
        

        public HashSet<string> AddValidation(Seller entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Seller entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Seller entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Seller entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Seller parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Seller parameters)
        {
            throw new NotImplementedException();
        }

        public ISellerUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface ISellerDomain : ICoreDomain<Seller, Seller> { }
}
