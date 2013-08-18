class Account < ActiveRecord::Base
  has_many :transactions
  belongs_to :user

  after_create :create_initial_transaction

  attr_accessor :initial_balance

  private
    def create_initial_transaction
      transactions.create(amount: initial_balance)
    end

end
