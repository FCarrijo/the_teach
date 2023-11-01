require "test_helper"

class AgendaProfessoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agenda_professor = agenda_professores(:one)
  end

  test "should get index" do
    get agenda_professores_url
    assert_response :success
  end

  test "should get new" do
    get new_agenda_professor_url
    assert_response :success
  end

  test "should create agenda_professor" do
    assert_difference("AgendaProfessor.count") do
      post agenda_professores_url, params: { agenda_professor: { dia: @agenda_professor.dia, disciplina_id: @agenda_professor.disciplina_id, horario: @agenda_professor.horario, professor_id: @agenda_professor.professor_id } }
    end

    assert_redirected_to agenda_professor_url(AgendaProfessor.last)
  end

  test "should show agenda_professor" do
    get agenda_professor_url(@agenda_professor)
    assert_response :success
  end

  test "should get edit" do
    get edit_agenda_professor_url(@agenda_professor)
    assert_response :success
  end

  test "should update agenda_professor" do
    patch agenda_professor_url(@agenda_professor), params: { agenda_professor: { dia: @agenda_professor.dia, disciplina_id: @agenda_professor.disciplina_id, horario: @agenda_professor.horario, professor_id: @agenda_professor.professor_id } }
    assert_redirected_to agenda_professor_url(@agenda_professor)
  end

  test "should destroy agenda_professor" do
    assert_difference("AgendaProfessor.count", -1) do
      delete agenda_professor_url(@agenda_professor)
    end

    assert_redirected_to agenda_professores_url
  end
end
