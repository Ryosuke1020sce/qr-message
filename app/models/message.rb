class Message < ApplicationRecord
  before_create :generate_uuid

  belongs_to :user
  has_many :letters
  has_many :comments

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

end
