require "test_helper"

class EscolaridadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escolaridade = escolaridades(:one)
  end

  test "should get index" do
    get escolaridades_url
    assert_response :success
  end

  test "should get new" do
    get new_escolaridade_url
    assert_response :success
  end

  test "should create escolaridade" do
    assert_difference("Escolaridade.count") do
      post escolaridades_url, params: { escolaridade: { nome: @escolaridade.nome } }
    end

    assert_redirected_to escolaridade_url(Escolaridade.last)
  end

  test "should show escolaridade" do
    get escolaridade_url(@escolaridade)
    assert_response :success
  end

  test "should get edit" do
    get edit_escolaridade_url(@escolaridade)
    assert_response :success
  end

  test "should update escolaridade" do
    patch escolaridade_url(@escolaridade), params: { escolaridade: { nome: @escolaridade.nome } }
    assert_redirected_to escolaridade_url(@escolaridade)
  end

  test "should destroy escolaridade" do
    assert_difference("Escolaridade.count", -1) do
      delete escolaridade_url(@escolaridade)
    end

    assert_redirected_to escolaridades_url
  end
end
