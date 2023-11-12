require "application_system_test_case"

class InteresseAlunosTest < ApplicationSystemTestCase
  setup do
    @interesse_aluno = interesse_alunos(:one)
  end

  test "visiting the index" do
    visit interesse_alunos_url
    assert_selector "h1", text: "Interesse area_aluno"
  end

  test "should create interesse aluno" do
    visit interesse_alunos_url
    click_on "New interesse aluno"

    fill_in "Aluno", with: @interesse_aluno.aluno_id
    fill_in "Area", with: @interesse_aluno.area_id
    click_on "Create Interesse aluno"

    assert_text "Interesse aluno was successfully created"
    click_on "Back"
  end

  test "should update Interesse aluno" do
    visit interesse_aluno_url(@interesse_aluno)
    click_on "Edit this interesse aluno", match: :first

    fill_in "Aluno", with: @interesse_aluno.aluno_id
    fill_in "Area", with: @interesse_aluno.area_id
    click_on "Update Interesse aluno"

    assert_text "Interesse aluno was successfully updated"
    click_on "Back"
  end

  test "should destroy Interesse aluno" do
    visit interesse_aluno_url(@interesse_aluno)
    click_on "Destroy this interesse aluno", match: :first

    assert_text "Interesse aluno was successfully destroyed"
  end
end
