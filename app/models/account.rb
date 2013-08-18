class Account < ActiveRecord::Base
  has_many :transactions
  belongs_to :user

  validates :description, presence: true, uniqueness: { scope: :user_id }
  validates :initial_balance, presence: true, on: :create

  after_create :create_initial_transaction

  attr_accessor :initial_balance

  def balance
    transactions.sum(:amount) / 100.0
  end

  private
    def create_initial_transaction
      transactions.create(amount: initial_balance)
    end

end
