class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :user_stocks
   has_many :stocks, through: :user_stocks
   has_many :friendships
   has_many :friends, through: :friendships

   def full_name
      return "#{first_name.upcase} #{last_name.upcase}" if(first_name || last_name)
      
      return "Anonymus"
   end
   def stock_already_exist?(ticker_symbol)
   	  stock = Stock.find_by_ticker(ticker_symbol)
   	  return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
   end

   def max_limit?
   	  (user_stocks.count < 10)
   end

   def can_add_stock?(ticker_symbol)
   	  (max_limit? && !stock_already_exist?(ticker_symbol))
   end

  # for finding users from user_lookup_form
   def self.first_name_find(fname)
     where("first_name like ?", "%#{fname}%")
   end

   def self.last_name_find(lname)
     where("last_name like ?", "%#{lname}%")
   end

   def self.email_find(mail)
     where("email like ?", "%#{mail}%")
   end

   def self.search(name)
      (first_name_find(name)+last_name_find(name)+email_find(name)).uniq
   end
end
