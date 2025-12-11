class Message < ApplicationRecord
  before_create :generate_uuid

  belongs_to :user

  has_many :letters, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :links, dependent: :destroy
  has_many :dtct_reqs, dependent: :destroy

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

end
