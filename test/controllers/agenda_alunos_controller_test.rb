require "test_helper"

class AgendaAlunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agenda_aluno = agenda_alunos(:one)
  end

  test "should get index" do
    get agenda_alunos_url
    assert_response :success
  end

  test "should get new" do
    get new_agenda_aluno_url
    assert_response :success
  end

  test "should create agenda_aluno" do
    assert_difference("AgendaAluno.count") do
      post agenda_alunos_url, params: { agenda_aluno: { agenda_professor_id: @agenda_aluno.agenda_professor_id, aluno_id: @agenda_aluno.aluno_id, observacao: @agenda_aluno.observacao } }
    end

    assert_redirected_to agenda_aluno_url(AgendaAluno.last)
  end

  test "should show agenda_aluno" do
    get agenda_aluno_url(@agenda_aluno)
    assert_response :success
  end

  test "should get edit" do
    get edit_agenda_aluno_url(@agenda_aluno)
    assert_response :success
  end

  test "should update agenda_aluno" do
    patch agenda_aluno_url(@agenda_aluno), params: { agenda_aluno: { agenda_professor_id: @agenda_aluno.agenda_professor_id, aluno_id: @agenda_aluno.aluno_id, observacao: @agenda_aluno.observacao } }
    assert_redirected_to agenda_aluno_url(@agenda_aluno)
  end

  test "should destroy agenda_aluno" do
    assert_difference("AgendaAluno.count", -1) do
      delete agenda_aluno_url(@agenda_aluno)
    end

    assert_redirected_to agenda_alunos_url
  end
end
