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

namespace AmazonApp.Domain.ProductModule
{
    public class ColorDomain : IColorDomain
    {
        public ColorDomain(IProductUow uow, IDbContextManager<MainSqlDbContext> dbContextManager) {
            this.Uow = uow;
            DbContextManager = dbContextManager;
        }

        public async Task<object> GetAsync(Color parameters)
        {
            return await Uow.Repository<Color>().AllAsync();
            throw new NotImplementedException();
        }

        public async Task<object> GetBy(Color parameters)
        {
            // var spParameters = new SqlParameter[1];
            // spParameters[0] = new SqlParameter() { ParameterName = "ColorName", Value = parameters.ColorName };

            return await Uow.Repository<Color>().FindByAsync(t => t.ColorId == parameters.ColorId);
            // await DbContextManager.StoreProc<StoreProcResult>("[dbo].spFilterColors ", spParameters);
        }
        

        public HashSet<string> AddValidation(Color entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Color entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();




        }

        public HashSet<string> UpdateValidation(Color entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Color entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Color parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Color parameters)
        {
            throw new NotImplementedException();
        }

        

        public IProductUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
        private IDbContextManager<MainSqlDbContext> DbContextManager { get; set; }
    }

    public interface IColorDomain : ICoreDomain<Color, Color> { }
}
