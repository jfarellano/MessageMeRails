class Message < ApplicationRecord
	belongs_to :chat
	belongs_to :user
	validates :mensaje, presence: true
end
