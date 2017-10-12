class Group < ApplicationRecord
  has_many :users, through: :members
  has_many :messages
  has_many :members

  validates :name, presence: true
  validate :add_error_sample

  def add_error_sample
    # nameが空のときにエラーメッセージを追加する
    if name.empty?
    end
  end
end

