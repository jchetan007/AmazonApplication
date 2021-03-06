using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.PrimeMusicModule
{
    public class PrimeMusicDomain : IPrimeMusicDomain
    {
        public PrimeMusicDomain(IPrimeMusicUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(PrimeMusic parameters)
        {
            return await Uow.Repository<PrimeMusic>().AllAsync();
            //throw new NotImplementedException();
        }

        public async Task<object> GetBy(PrimeMusic parameters)
        {
           // return await Uow.Repository<PrimeMusic>().FindByAsync(t => t.PrimeMusicId == parameters.PrimeMusicId);
            var temp = 0;
            temp = Uow.Repository<PrimeMusic>().Count(t => t.PrimeMusicId == parameters.PrimeMusicId && t.AppUserId == parameters.AppUserId);
            if (temp != 0)
            {
                return await Task.FromResult("Successfully Verified");
            }
            else
            {
                return await Task.FromResult("Enter Correct Detail");
            }
        }
        

        public HashSet<string> AddValidation(PrimeMusic entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(PrimeMusic entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(PrimeMusic entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(PrimeMusic entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(PrimeMusic parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(PrimeMusic parameters)
        {
            throw new NotImplementedException();
        }

        public IPrimeMusicUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IPrimeMusicDomain : ICoreDomain<PrimeMusic, PrimeMusic> { }
}
