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

namespace AmazonApp.Domain.SellerModule
{
    public class SellerDetailFormDomain : ISellerDetailFormDomain
    {
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
        public SellerDetailFormDomain(ISellerUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
            DbContextManager = dbContextManager;
        }

        public Task<object> GetAsync(SellerDetailForm parameters)
        {
            throw new NotImplementedException();
        }

        public Task<object> GetBy(SellerDetailForm parameters)
        {
            throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(SellerDetailForm entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(SellerDetailForm entity)
        {
            var spParameters = new SqlParameter[12];
            spParameters[0] = new SqlParameter() { ParameterName = "AppUserId", Value = entity.AppUserId };
            spParameters[1] = new SqlParameter() { ParameterName = "CompanyName", Value = entity.CompanyName };
            spParameters[2] = new SqlParameter() { ParameterName = "Address", Value = entity.Address };
            spParameters[3] = new SqlParameter() { ParameterName = "PanNumber", Value = entity.PanNumber };
            spParameters[4] = new SqlParameter() { ParameterName = "Area", Value = entity.Area };
            spParameters[5] = new SqlParameter() { ParameterName = "Landmark", Value = entity.Landmark };
            spParameters[6] = new SqlParameter() { ParameterName = "City", Value = entity.City };
            spParameters[7] = new SqlParameter() { ParameterName = "State", Value = entity.State };
            spParameters[8] = new SqlParameter() { ParameterName = "AddressType", Value = entity.AddressType };
            spParameters[9] = new SqlParameter() { ParameterName = "AccountHolder", Value = entity.AccountHolderName };
            spParameters[10] = new SqlParameter() { ParameterName = "AccountType", Value = entity.AccountType };
            spParameters[11] = new SqlParameter() { ParameterName = "AccountNumber", Value = entity.AccountNumber };

            await DbContextManager.StoreProc<StoreProcResult>("[dbo].spSellers", spParameters);
            await DbContextManager.CommitAsync();
        }

        public HashSet<string> UpdateValidation(SellerDetailForm entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(SellerDetailForm entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(SellerDetailForm parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(SellerDetailForm parameters)
        {
            throw new NotImplementedException();
        }

        public ISellerUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface ISellerDetailFormDomain : ICoreDomain<SellerDetailForm, SellerDetailForm> { }
}
