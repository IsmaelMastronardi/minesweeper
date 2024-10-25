require "application_system_test_case"

class GameBoardsTest < ApplicationSystemTestCase
  setup do
    @game_board = game_boards(:one)
  end

  test "visiting the index" do
    visit game_boards_url
    assert_selector "h1", text: "Game boards"
  end

  test "should create game board" do
    visit game_boards_url
    click_on "New game board"

    fill_in "Board", with: @game_board.board
    fill_in "Bomb amount", with: @game_board.bomb_amount
    fill_in "Email", with: @game_board.email
    fill_in "Height", with: @game_board.height
    fill_in "Width", with: @game_board.width
    click_on "Create Game board"

    assert_text "Game board was successfully created"
    click_on "Back"
  end

  test "should update Game board" do
    visit game_board_url(@game_board)
    click_on "Edit this game board", match: :first

    fill_in "Board", with: @game_board.board
    fill_in "Bomb amount", with: @game_board.bomb_amount
    fill_in "Email", with: @game_board.email
    fill_in "Height", with: @game_board.height
    fill_in "Width", with: @game_board.width
    click_on "Update Game board"

    assert_text "Game board was successfully updated"
    click_on "Back"
  end

  test "should destroy Game board" do
    visit game_board_url(@game_board)
    click_on "Destroy this game board", match: :first

    assert_text "Game board was successfully destroyed"
  end
end
