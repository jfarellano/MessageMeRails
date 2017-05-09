class User < ApplicationRecord
	has_and_belongs_to_many :chats
	has_many :messages
	validates :name, presence: true
	validates :username, presence: true
	validates :password, presence: true
	validates :name, length: {minimum: 4}
	validates :username, length: {minimum: 4}
	validates :password, length: {in: 6..20}
	validates :username, uniqueness: true
end
