using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.UserModule
{
    public class VerifyLoginDomain : IVerifyLoginDomain
    {
        public VerifyLoginDomain(IUserUow uow)
        {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(AppUser parameters)

        {
            var temp = 0;
            temp = Uow.Repository<AppUser>().Count(t => t.AppUserId == parameters.AppUserId);
            if (temp != 0)
            {
                return await Task.FromResult("Successfully Verified");
            }
            else
            {
                return await Task.FromResult("Please Login");
            }
            // throw new NotImplementedException();
        }

        public async Task<object> GetBy(AppUser parameters)
        {
            var temp = 0;
            temp = Uow.Repository<AppUser>().Count(t => t.AppUserId == parameters.AppUserId);
            if (temp != 0)
            {
                return await Task.FromResult("Successfully Verified");
            }
            else
            {
                return await Task.FromResult("Please Login");
            }
            //throw new NotImplementedException();
        }


        public HashSet<string> AddValidation(AppUser entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(AppUser entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(AppUser entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(AppUser entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(AppUser parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(AppUser parameters)
        {
            throw new NotImplementedException();
        }

        public IUserUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IVerifyLoginDomain : ICoreDomain<AppUser, AppUser> { }
}
