require "application_system_test_case"

class UsableCardsTest < ApplicationSystemTestCase
  setup do
    @usable_card = usable_cards(:one)
  end

  test "visiting the index" do
    visit usable_cards_url
    assert_selector "h1", text: "Usable Cards"
  end

  test "creating a Usable card" do
    visit usable_cards_url
    click_on "New Usable Card"

    fill_in "Legion", with: @usable_card.legion
    fill_in "Name", with: @usable_card.name
    fill_in "Stage", with: @usable_card.stage
    fill_in "Tier", with: @usable_card.tier
    fill_in "Type", with: @usable_card.type
    click_on "Create Usable card"

    assert_text "Usable card was successfully created"
    click_on "Back"
  end

  test "updating a Usable card" do
    visit usable_cards_url
    click_on "Edit", match: :first

    fill_in "Legion", with: @usable_card.legion
    fill_in "Name", with: @usable_card.name
    fill_in "Stage", with: @usable_card.stage
    fill_in "Tier", with: @usable_card.tier
    fill_in "Type", with: @usable_card.type
    click_on "Update Usable card"

    assert_text "Usable card was successfully updated"
    click_on "Back"
  end

  test "destroying a Usable card" do
    visit usable_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usable card was successfully destroyed"
  end
end
