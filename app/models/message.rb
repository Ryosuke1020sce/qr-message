class Message < ApplicationRecord
  before_create :generate_uuid

  belongs_to :user

  has_many :letters, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :links, dependent: :destroy
  has_many :dtct_reqs, dependent: :destroy

  before_destroy :destroy_as_link_target

  private

  def destroy_as_link_target
    Link.where(linked_message_id: id).destroy_all
  end

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

end
