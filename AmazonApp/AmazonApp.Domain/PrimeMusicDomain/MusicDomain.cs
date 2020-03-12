using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.PrimeMusicModule
{
    public class MusicDomain : IMusicDomain
    {
        public MusicDomain(IPrimeMusicUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(Music parameters)
        {
            return await Uow.Repository<Music>().AllAsync();
            //  throw new NotImplementedException();
        }

        public async Task<object> GetBy(Music parameters)
        {
            return await Uow.Repository<Music>().FindByAsync(t => t.MusicId == parameters.MusicId);
            // throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(Music entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Music entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Music entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Music entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Music parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Music parameters)
        {
            throw new NotImplementedException();
        }

        public IPrimeMusicUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IMusicDomain : ICoreDomain<Music, Music> { }
}
