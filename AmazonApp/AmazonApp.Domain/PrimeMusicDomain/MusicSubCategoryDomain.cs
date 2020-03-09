using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.PrimeMusicModule
{
    public class MusicSubCategoryDomain : IMusicSubCategoryDomain
    {
        public MusicSubCategoryDomain(IPrimeMusicUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(MusicSubCategory parameters)
        {
            return await Uow.Repository<MusicSubCategory>().AllAsync();
        }

        public async Task<object> GetBy(MusicSubCategory parameters)
        {
            return await Uow.Repository<MusicSubCategory>().FindByAsync(t => t.MusicSubCategoryId == parameters.MusicSubCategoryId);
        }
        

        public HashSet<string> AddValidation(MusicSubCategory entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(MusicSubCategory entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(MusicSubCategory entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(MusicSubCategory entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(MusicSubCategory parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(MusicSubCategory parameters)
        {
            throw new NotImplementedException();
        }

        public IPrimeMusicUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IMusicSubCategoryDomain : ICoreDomain<MusicSubCategory, MusicSubCategory> { }
}
