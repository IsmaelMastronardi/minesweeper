require "test_helper"

class GameBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_board = game_boards(:one)
  end

  test "should get index" do
    get game_boards_url
    assert_response :success
  end

  test "should get new" do
    get new_game_board_url
    assert_response :success
  end

  test "should create game_board" do
    assert_difference("GameBoard.count") do
      post game_boards_url, params: { game_board: { board: @game_board.board, bomb_amount: @game_board.bomb_amount, email: @game_board.email, height: @game_board.height, width: @game_board.width } }
    end

    assert_redirected_to game_board_url(GameBoard.last)
  end

  test "should show game_board" do
    get game_board_url(@game_board)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_board_url(@game_board)
    assert_response :success
  end

  test "should update game_board" do
    patch game_board_url(@game_board), params: { game_board: { board: @game_board.board, bomb_amount: @game_board.bomb_amount, email: @game_board.email, height: @game_board.height, width: @game_board.width } }
    assert_redirected_to game_board_url(@game_board)
  end

  test "should destroy game_board" do
    assert_difference("GameBoard.count", -1) do
      delete game_board_url(@game_board)
    end

    assert_redirected_to game_boards_url
  end
end
