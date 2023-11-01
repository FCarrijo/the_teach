require "application_system_test_case"

class PaisTest < ApplicationSystemTestCase
  setup do
    @pai = pais(:one)
  end

  test "visiting the index" do
    visit pais_url
    assert_selector "h1", text: "paises"
  end

  test "should create pai" do
    visit pais_url
    click_on "New pai"

    fill_in "Nome", with: @pai.nome
    click_on "Create Pai"

    assert_text "Pai was successfully created"
    click_on "Back"
  end

  test "should update Pai" do
    visit pai_url(@pai)
    click_on "Edit this pai", match: :first

    fill_in "Nome", with: @pai.nome
    click_on "Update Pai"

    assert_text "Pai was successfully updated"
    click_on "Back"
  end

  test "should destroy Pai" do
    visit pai_url(@pai)
    click_on "Destroy this pai", match: :first

    assert_text "Pai was successfully destroyed"
  end
end
