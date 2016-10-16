class Tournament < ApplicationRecord
  attr_accessor :statusssss

  has_many :players
  has_many :teams

  enum status: [:signup, :teams_created, :groups_created, :started, :finished]

  before_create :set_default_status

  private

  def set_default_status
    self.status = :signup
  end
end
