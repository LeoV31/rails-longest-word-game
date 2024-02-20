require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "User fills form with a random word and gets a message that the word is not in the grid" do
    visit new_url
    fill_in "question", with: "random"
    click_on "Play"
    assert_text "not in the grid"
  end

  test "You can fill the form with a one-letter consonant word, click play, and get a message that the word is not a valid English word" do
    visit new_url
    fill_in "question", with: "c"
    click_on "Play"
    assert_text "not in the grid"
  end
end
