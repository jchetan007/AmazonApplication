using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using RxWeb.Core;
using AmazonApp.UnitOfWork.Main;
using AmazonApp.Models.Main;

namespace AmazonApp.Domain.PaymentModule
{
    public class CardDomain : ICardDomain
    {
        public CardDomain(IPaymentUow uow) {
            this.Uow = uow;
        }

        public async Task<object> GetAsync(Card parameters)
        {
            return await Uow.Repository<Card>().AllAsync();
        }

        public async Task<object> GetBy(Card parameters)
        {
            return await Uow.Repository<Card>().FindByAsync(t => t.CardId == parameters.CardId);
        }
        

        public HashSet<string> AddValidation(Card entity)
        {
            return ValidationMessages;
        }

        public async Task AddAsync(Card entity)
        {
            await Uow.RegisterNewAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> UpdateValidation(Card entity)
        {
            return ValidationMessages;
        }

        public async Task UpdateAsync(Card entity)
        {
            await Uow.RegisterDirtyAsync(entity);
            await Uow.CommitAsync();
        }

        public HashSet<string> DeleteValidation(Card parameters)
        {
            return ValidationMessages;
        }

        public Task DeleteAsync(Card parameters)
        {
            throw new NotImplementedException();
        }

        public IPaymentUow Uow { get; set; }

        private HashSet<string> ValidationMessages { get; set; } = new HashSet<string>();
    }


    public interface ICardDomain : ICoreDomain<Card, Card> { }
}
