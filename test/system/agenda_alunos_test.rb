require "application_system_test_case"

class AgendaAlunosTest < ApplicationSystemTestCase
  setup do
    @agenda_aluno = agenda_alunos(:one)
  end

  test "visiting the index" do
    visit agenda_alunos_url
    assert_selector "h1", text: "Agenda area_aluno"
  end

  test "should create agenda aluno" do
    visit agenda_alunos_url
    click_on "New agenda aluno"

    fill_in "Agenda professor", with: @agenda_aluno.agenda_professor_id
    fill_in "Aluno", with: @agenda_aluno.aluno_id
    fill_in "Observacao", with: @agenda_aluno.observacao
    click_on "Create Agenda aluno"

    assert_text "Agenda aluno was successfully created"
    click_on "Back"
  end

  test "should update Agenda aluno" do
    visit agenda_aluno_url(@agenda_aluno)
    click_on "Edit this agenda aluno", match: :first

    fill_in "Agenda professor", with: @agenda_aluno.agenda_professor_id
    fill_in "Aluno", with: @agenda_aluno.aluno_id
    fill_in "Observacao", with: @agenda_aluno.observacao
    click_on "Update Agenda aluno"

    assert_text "Agenda aluno was successfully updated"
    click_on "Back"
  end

  test "should destroy Agenda aluno" do
    visit agenda_aluno_url(@agenda_aluno)
    click_on "Destroy this agenda aluno", match: :first

    assert_text "Agenda aluno was successfully destroyed"
  end
end
