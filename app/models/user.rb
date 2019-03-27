class User < ApplicationRecord

    has_many :expenses
    has_many :posts
    
    has_many :groups, through: :group_users
    has_many :group_users

    validates :email, {uniqueness: true}
    validates :password, {presence: true}

end