class GameBoardsController < ApplicationController
  before_action :set_game_board, only: %i[ show edit update destroy ]

  def home
    @game_boards = GameBoard.order(created_at: :desc).limit(10).paginate(page: params[:page], per_page: 10)
    @game_board = GameBoard.new
  end

  # GET /game_boards or /game_boards.json
  def index
    @game_boards = GameBoard.all.paginate(page: params[:page], per_page: 10)
  end

  # GET /game_boards/1 or /game_boards/1.json
  def show
  end

  # GET /game_boards/new
  def new
    @game_board = GameBoard.new
  end

  # GET /game_boards/1/edit
  def edit
  end

  # POST /game_boards or /game_boards.json
  def create
    @game_board = GameBoard.new(game_board_params)
    generated_board = generateBoard(@game_board)

    if generated_board == 'Too many bombs'
      flash[:alert] = 'Too many bombs for the amount of squares selected'
      redirect_to root_path
    else
      @game_board.board = generated_board
      if @game_board.save
        redirect_to @game_board
      else
        flash[:alert] = @game_board.errors.full_messages.to_sentence
        redirect_to root_path
      end
    end
  end

  # PATCH/PUT /game_boards/1 or /game_boards/1.json
  def update
    respond_to do |format|
      if @game_board.update(game_board_params)
        format.html { redirect_to @game_board, notice: "Game board was successfully updated." }
        format.json { render :show, status: :ok, location: @game_board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_boards/1 or /game_boards/1.json
  def destroy
    @game_board.destroy!

    respond_to do |format|
      format.html { redirect_to game_boards_path, status: :see_other, notice: "Game board was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_board
      @game_board = GameBoard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_board_params
      params.require(:game_board).permit(:name, :width, :height, :bomb_amount, :email)
    end

    def generateBoard(game_board)
      width = game_board.width
      height = game_board.height
      bomb_amount = game_board.bomb_amount

      if bomb_amount > width * height
        return 'Too many bombs'
      end
    
      board = []
    
      (height * width).times do
        board.push({ bomb: false, revealed: false, attached_bombs: 0 })
      end
    
      bomb_locations = [*0..((width * height) - 1)].sample(bomb_amount)
      bomb_locations.each do |loc|
        board[loc]['bomb'] = true
        update_squares(board, loc, width, height)
      end
    
      board  = board.each_slice(height).to_a
      return board
    end

    def update_squares(board, loc, width, height)
      actual_row = loc / width
      actual_col = loc % width
      positions = [-1, 0, 1]
    
      positions.each do |row_dir|
        row = actual_row + row_dir
        positions.each do |col_dir|
          col = actual_col + col_dir          
          if (row != actual_row || col != actual_col) && 
             (row >= 0 && row < height) && 
             (col >= 0 && col < width)
            
            index = row * width + col
            board[index][:attached_bombs] += 1
          end
        end
      end
    end

end
