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
using AmazonApp.Infrastructure.Security;

namespace AmazonApp.Domain.UserModule
{
    public class AppUserDomain : IAppUserDomain
    {
        bool flag = true;
        private IPasswordHash PasswordHash { get; set; }
        private IApplicationTokenProvider ApplicationTokenProvider { get; set; }
        public AppUserDomain(IUserUow uow, IDbContextManager<MainSqlDbContext> dbContextManager, IPasswordHash passwordHash, IApplicationTokenProvider tokenProvider) {
            this.Uow = uow;
            PasswordHash = passwordHash;
            ApplicationTokenProvider = tokenProvider;
        }

        public async Task<object> GetAsync(AppUser parameters)
        {
            
             return await Uow.Repository<AppUser>().AllAsync();
           
            //throw new NotImplementedException();
        }

        public async Task<object> GetBy(AppUser parameters)
        {
           
            var result =  await Uow.Repository<AppUser>().SingleOrDefaultAsync(t => t.MobileNumber == parameters.MobileNumber);
            if(result != null && PasswordHash.VerifySignature(parameters.userPassword, result.Password, result.Salt))
            {
                var token = await ApplicationTokenProvider.GetTokenAsync(result);
                result.token = token;
                return (result);
            }
            else
            {
                return await Task.FromResult("Try Again Please");
            }
            //throw new NotImplementedException();
        }


        public HashSet<string> AddValidation(AppUser entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(AppUser entity)
        {
            AppUser appuser = new AppUser();
            PasswordResult passwordResult = PasswordHash.Encrypt(entity.userPassword);
            appuser.AppUserName = entity.AppUserName;
            appuser.MobileNumber = entity.MobileNumber;
            appuser.EmailId = entity.EmailId;
            appuser.CreatedDate = entity.CreatedDate;
            appuser.RoleId = entity.RoleId;
            appuser.Password = passwordResult.Signature;
            appuser.Salt = passwordResult.Salt;
            await Uow.RegisterNewAsync(appuser);
            await Uow.CommitAsync();
            //throw new NotImplementedException();

            //return await Task.FromResult(entity.AppUserId);
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
            await DbContextManager.CommitAsync();

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
