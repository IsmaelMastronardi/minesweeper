class GameBoard < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :width, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :height, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :bomb_amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :board, presence: true
  
  after_create :initialize_board

  private

  def initialize_board
    update(board: [])
  end
end
