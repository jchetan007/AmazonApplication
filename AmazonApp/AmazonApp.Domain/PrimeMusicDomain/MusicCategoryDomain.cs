using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.PrimeMusicModule
{
    public class MusicCategoryDomain : IMusicCategoryDomain
    {
        public MusicCategoryDomain(IPrimeMusicUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(MusicCategory parameters)
        {
            return await Uow.Repository<MusicCategory>().AllAsync();
        }

        public async Task<object> GetBy(MusicCategory parameters)
        {
            return await Uow.Repository<MusicSubCategory>().FindByAsync(t => t.MusicCategoryId == parameters.MusicCategoryId);
        }
        

        public HashSet<string> AddValidation(MusicCategory entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(MusicCategory entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(MusicCategory entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(MusicCategory entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(MusicCategory parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(MusicCategory parameters)
        {
            throw new NotImplementedException();
        }

        public IPrimeMusicUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IMusicCategoryDomain : ICoreDomain<MusicCategory, MusicCategory> { }
}
