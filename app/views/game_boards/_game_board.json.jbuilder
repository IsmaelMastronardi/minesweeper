json.extract! game_board, :id,:name, :width, :height, :bomb_amount, :email, :board, :created_at, :updated_at
json.url game_board_url(game_board, format: :json)
