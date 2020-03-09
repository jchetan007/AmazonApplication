using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.UserModule
{
    public class UserAddressDomain : IUserAddressDomain
    {
        public UserAddressDomain(IUserUow uow) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(UserAddress parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(UserAddress parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(UserAddress entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(UserAddress entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(UserAddress entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(UserAddress entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(UserAddress parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(UserAddress parameters)
        {
            throw new NotImplementedException();
        }

        public IUserUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IUserAddressDomain : ICoreDomain<UserAddress, UserAddress> { }
}
