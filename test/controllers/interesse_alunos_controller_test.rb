require "test_helper"

class InteresseAlunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interesse_aluno = interesse_alunos(:one)
  end

  test "should get index" do
    get interesse_alunos_url
    assert_response :success
  end

  test "should get new" do
    get new_interesse_aluno_url
    assert_response :success
  end

  test "should create interesse_aluno" do
    assert_difference("InteresseAluno.count") do
      post interesse_alunos_url, params: { interesse_aluno: { aluno_id: @interesse_aluno.aluno_id, area_id: @interesse_aluno.area_id } }
    end

    assert_redirected_to interesse_aluno_url(InteresseAluno.last)
  end

  test "should show interesse_aluno" do
    get interesse_aluno_url(@interesse_aluno)
    assert_response :success
  end

  test "should get edit" do
    get edit_interesse_aluno_url(@interesse_aluno)
    assert_response :success
  end

  test "should update interesse_aluno" do
    patch interesse_aluno_url(@interesse_aluno), params: { interesse_aluno: { aluno_id: @interesse_aluno.aluno_id, area_id: @interesse_aluno.area_id } }
    assert_redirected_to interesse_aluno_url(@interesse_aluno)
  end

  test "should destroy interesse_aluno" do
    assert_difference("InteresseAluno.count", -1) do
      delete interesse_aluno_url(@interesse_aluno)
    end

    assert_redirected_to interesse_alunos_url
  end
end
