using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.PaymentModule
{
    public class VerifyPromoCodeDomain : IVerifyPromoCodeDomain
    {
        public VerifyPromoCodeDomain(IPaymentUow uow) {
            this.Uow = uow;
        }

        public Task<object> GetAsync(PromoCode parameters)
        {
            throw new NotImplementedException();
        }

        public async Task<object> GetBy(PromoCode parameters)
        {
            var temp = 0;
            temp = Uow.Repository<PromoCode>().Count(t => t.PromoCodeId == parameters.PromoCodeId && t.PromoCodeName == parameters.PromoCodeName);
            if (temp != 0)
            {
                return await Task.FromResult("Successfully Verified");
            }
            else
            {
                return await Task.FromResult("Enter Correct Otp");
            }
            //throw new NotImplementedException();
        }
        

        public HashSet<string> AddValidation(PromoCode entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(PromoCode entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(PromoCode entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(PromoCode entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(PromoCode parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(PromoCode parameters)
        {
            throw new NotImplementedException();
        }

        public IPaymentUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }

    public interface IVerifyPromoCodeDomain : ICoreDomain<PromoCode, PromoCode> { }
}
