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
            var login = await Uow.Repository<PrimeMusic>().SingleOrDefaultAsync(t => t.AppUserId == parameters.AppUserId );
            if (login != null)
            {
                return await Task.FromResult("Success");
            }
            else
            {
                return await Task.FromResult("Failed");
            }

            throw new NotImplementedException();
        }

        public Task<object> GetBy(PrimeMusic parameters)
        {
            throw new NotImplementedException();
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
