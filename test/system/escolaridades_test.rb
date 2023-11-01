require "application_system_test_case"

class EscolaridadesTest < ApplicationSystemTestCase
  setup do
    @escolaridade = escolaridades(:one)
  end

  test "visiting the index" do
    visit escolaridades_url
    assert_selector "h1", text: "Escolaridades"
  end

  test "should create escolaridade" do
    visit escolaridades_url
    click_on "New escolaridade"

    fill_in "Nome", with: @escolaridade.nome
    click_on "Create Escolaridade"

    assert_text "Escolaridade was successfully created"
    click_on "Back"
  end

  test "should update Escolaridade" do
    visit escolaridade_url(@escolaridade)
    click_on "Edit this escolaridade", match: :first

    fill_in "Nome", with: @escolaridade.nome
    click_on "Update Escolaridade"

    assert_text "Escolaridade was successfully updated"
    click_on "Back"
  end

  test "should destroy Escolaridade" do
    visit escolaridade_url(@escolaridade)
    click_on "Destroy this escolaridade", match: :first

    assert_text "Escolaridade was successfully destroyed"
  end
end
