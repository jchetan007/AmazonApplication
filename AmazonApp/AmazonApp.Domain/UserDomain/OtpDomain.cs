using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;
using RxWeb.Core.Data;
using AmazonApp.BoundedContext.SqlContext;


namespace AmazonApp.Domain.UserModule
{
    public class OtpDomain : IOtpDomain
    {
        
        public OtpDomain(IUserUow uow) {
            this.Uow = uow;
           
        }

        public async Task<object> GetAsync(Otp parameters)
        {
            Random rand = new Random();
            parameters.OtpNumber = rand.Next(1000, 9999);
            parameters.ValidFrom = System.DateTime.Now;
            parameters.ValidTill = parameters.ValidFrom.AddMinutes(2);
            await Uow.RegisterNewAsync(parameters);
            await Uow.CommitAsync();
            //var otplist = (object) this.Uow.Repository<Otp>().All();
            //return Task.FromResult(otplist);
            return await Task.FromResult(parameters.OtpId);
        }

        public async Task<object> GetBy(Otp parameters)
        {
            Random rand = new Random();
            parameters.OtpNumber = rand.Next(1000, 9999);
            parameters.ValidFrom = System.DateTime.Now;
            parameters.ValidTill = parameters.ValidFrom.AddMinutes(2);
            await Uow.RegisterNewAsync(parameters);
            await Uow.CommitAsync();
            //return await Uow.Repository<Otp>().FindByAsync(t => t.OtpId == parameters.OtpId);
            return await Task.FromResult(parameters.OtpId);
            //throw new NotImplementedException();


        }


        public HashSet<string> AddValidation(Otp entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Otp entity)
        {
            //Random rand = new Random();
            //entity.OtpNumber = rand.Next(1000, 9999);
            //entity.ValidFrom = System.DateTime.Now;
            //entity.ValidTill = entity.ValidFrom.AddMinutes(2);
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
           
            //return (object) await Task.FromResult(parameters.OtpNumber);

        }

        public HashSet<string> UpdateValidation(Otp entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Otp entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Otp parameters)
        {
            return ValidationMessages;
        }

        public async Task DeleteAsync(Otp parameters)
        {
            var currenttime = System.DateTime.Now;
            if(parameters.ValidTill<currenttime)
            {
               var validtill = Uow.Repository<Otp>().FindByKey(parameters.OtpId);
               await Uow.RegisterDeletedAsync(validtill);
               await Uow.CommitAsync();
            }
            //throw new NotImplementedException();
        }

        
        public IUserUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IOtpDomain : ICoreDomain<Otp, Otp> { }
}
