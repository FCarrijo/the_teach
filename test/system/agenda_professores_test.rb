require "application_system_test_case"

class AgendaProfessoresTest < ApplicationSystemTestCase
  setup do
    @agenda_professor = agenda_professores(:one)
  end

  test "visiting the index" do
    visit agenda_professores_url
    assert_selector "h1", text: "Agenda professores"
  end

  test "should create agenda professor" do
    visit agenda_professores_url
    click_on "New agenda professor"

    fill_in "Dia", with: @agenda_professor.dia
    fill_in "Disciplina id", with: @agenda_professor.disciplina_id
    fill_in "Horario", with: @agenda_professor.horario
    fill_in "Professor id", with: @agenda_professor.professor_id
    click_on "Create Agenda professor"

    assert_text "Agenda professor was successfully created"
    click_on "Back"
  end

  test "should update Agenda professor" do
    visit agenda_professor_url(@agenda_professor)
    click_on "Edit this agenda professor", match: :first

    fill_in "Dia", with: @agenda_professor.dia
    fill_in "Disciplina id", with: @agenda_professor.disciplina_id
    fill_in "Horario", with: @agenda_professor.horario
    fill_in "Professor id", with: @agenda_professor.professor_id
    click_on "Update Agenda professor"

    assert_text "Agenda professor was successfully updated"
    click_on "Back"
  end

  test "should destroy Agenda professor" do
    visit agenda_professor_url(@agenda_professor)
    click_on "Destroy this agenda professor", match: :first

    assert_text "Agenda professor was successfully destroyed"
  end
end
