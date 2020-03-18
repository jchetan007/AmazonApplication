using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.PrimeMusicModule
{
    public class vMusicDomain : IvMusicDomain
    {
        public vMusicDomain(IPrimeMusicUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(vMusic parameters)
        {
            return await Uow.Repository<vMusic>().AllAsync();
        }

        public async Task<object> GetBy(vMusic parameters)
        {
            return await Uow.Repository<vMusic>().FindByAsync(t => t.MusicSubCategoryId == parameters.MusicSubCategoryId);
           // throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(vMusic entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(vMusic entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(vMusic entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(vMusic entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(vMusic parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(vMusic parameters)
        {
            throw new NotImplementedException();
        }

        public IPrimeMusicUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IvMusicDomain : ICoreDomain<vMusic, vMusic> { }
}
