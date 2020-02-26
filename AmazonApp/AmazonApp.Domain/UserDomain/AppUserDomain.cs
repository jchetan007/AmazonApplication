using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.UserModule
{
    public class AppUserDomain : IAppUserDomain
    {
        bool flag = true;
        public AppUserDomain(IUserUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(AppUser parameters)
        {
            var login = await Uow.Repository<AppUser>().SingleOrDefaultAsync(t => t.MobileNumber == parameters.MobileNumber && t.UserPassword == parameters.UserPassword);
            if (login != null)
            {
                return await Task.FromResult("Success");
            }
            else
            {
                return await Task.FromResult("Failed");
            }

            //throw new NotImplementedException();
        }

        public async Task<object> GetBy(AppUser parameters)
        {
            var isAvailable = await Uow.Repository<AppUser>().SingleOrDefaultAsync(t => t.AppUserName == parameters.AppUserName);
            if (isAvailable == null)
            {
                flag = false;
                //generating OTP
                Random random = new Random();
                int randomNumber = random.Next(1000, 9999);
                return await Task.FromResult(randomNumber);
            }
            else
            {
                flag = true;
                return await Task.FromResult("Available");
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

        Task<object> ICoreDomain<AppUser, AppUser>.GetAsync(AppUser parameters)
        {
            throw new NotImplementedException();
        }

        Task<object> ICoreDomain<AppUser, AppUser>.GetBy(AppUser parameters)
        {
            throw new NotImplementedException();
        }

        HashSet<string> ICoreDomain<AppUser, AppUser>.AddValidation(AppUser entity)
        {
            throw new NotImplementedException();
        }

        HashSet<string> ICoreDomain<AppUser, AppUser>.UpdateValidation(AppUser entity)
        {
            throw new NotImplementedException();
        }

        Task ICoreDomain<AppUser, AppUser>.AddAsync(AppUser entity)
        {
            throw new NotImplementedException();
        }

        Task ICoreDomain<AppUser, AppUser>.UpdateAsync(AppUser entity)
        {
            throw new NotImplementedException();
        }

        HashSet<string> ICoreDomain<AppUser, AppUser>.DeleteValidation(AppUser parameters)
        {
            throw new NotImplementedException();
        }

        Task ICoreDomain<AppUser, AppUser>.DeleteAsync(AppUser parameters)
        {
            throw new NotImplementedException();
        }

        public IUserUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IAppUserDomain : ICoreDomain<AppUser, AppUser> { }
}
