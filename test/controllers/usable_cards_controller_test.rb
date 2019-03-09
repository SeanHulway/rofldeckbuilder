require 'test_helper'

class UsableCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usable_card = usable_cards(:one)
  end

  test "should get index" do
    get usable_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_usable_card_url
    assert_response :success
  end

  test "should create usable_card" do
    assert_difference('UsableCard.count') do
      post usable_cards_url, params: { usable_card: { legion: @usable_card.legion, name: @usable_card.name, stage: @usable_card.stage, tier: @usable_card.tier, type: @usable_card.type } }
    end

    assert_redirected_to usable_card_url(UsableCard.last)
  end

  test "should show usable_card" do
    get usable_card_url(@usable_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_usable_card_url(@usable_card)
    assert_response :success
  end

  test "should update usable_card" do
    patch usable_card_url(@usable_card), params: { usable_card: { legion: @usable_card.legion, name: @usable_card.name, stage: @usable_card.stage, tier: @usable_card.tier, type: @usable_card.type } }
    assert_redirected_to usable_card_url(@usable_card)
  end

  test "should destroy usable_card" do
    assert_difference('UsableCard.count', -1) do
      delete usable_card_url(@usable_card)
    end

    assert_redirected_to usable_cards_url
  end
end
