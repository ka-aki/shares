class Group < ApplicationRecord
    has_secure_password
    
    has_many :users, through: :group_users
    has_many :group_users
    accepts_nested_attributes_for :group_users

    validates :name, {uniqueness: true}
    validates :password, {presence: true}
end
