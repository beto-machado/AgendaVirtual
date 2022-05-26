# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validates :phone, presence: true, length: { maximum: 12 }
end
