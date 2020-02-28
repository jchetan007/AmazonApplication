using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;
using RxWeb.Core.Data;
using AmazonApp.BoundedContext.SqlContext;
using Microsoft.Data.SqlClient;
using AmazonApp.Models.ViewModels;
using RxWeb.Core.Security.Cryptography;

namespace AmazonApp.Domain.UserModule
{
    public class AppUserDomain : IAppUserDomain
    {
        bool flag = true;
        private IPasswordHash PasswordHash { get; set; }
        public AppUserDomain(IUserUow uow, IDbContextManager<MainSqlDbContext> dbContextManager, IPasswordHash passwordHash) {
            this.Uow = uow;
            PasswordHash = passwordHash;
        }

        public async Task<object> GetAsync(AppUser parameters)
        {
            
             return await Uow.Repository<AppUser>().AllAsync();
           
            //throw new NotImplementedException();
        }

        public async Task<object> GetBy(AppUser parameters)
        {
           
            return await Uow.Repository<AppUser>().FindByAsync(t => t.MobileNumber == parameters.MobileNumber);
            
            //throw new NotImplementedException();
        }


        public HashSet<string> AddValidation(AppUser entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(AppUser entity)
        {

            PasswordResult passwordResult = PasswordHash.Encrypt(Convert.ToBase64String(entity.Password));
            entity.Password = passwordResult.Signature;
            entity.Salt = passwordResult.Salt;
            await Uow.RegisterNewAsync<AppUser>(entity);
            //throw new NotImplementedException();
        }

        public HashSet<string> UpdateValidation(AppUser entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(AppUser parameters)
        {
           

            var spParameters = new SqlParameter[2];
            spParameters[0] = new SqlParameter() { ParameterName = "AppUserId", Value = parameters.AppUserId };
            spParameters[1] = new SqlParameter() { ParameterName = "UserPassword", Value = parameters.Password };



            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spChangePassword ", spParameters);
            
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
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface IAppUserDomain : ICoreDomain<AppUser, AppUser> { }
}
