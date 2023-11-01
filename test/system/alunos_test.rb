require "application_system_test_case"

class AlunosTest < ApplicationSystemTestCase
  setup do
    @aluno = alunos(:one)
  end

  test "visiting the index" do
    visit alunos_url
    assert_selector "h1", text: "Alunos"
  end

  test "should create aluno" do
    visit alunos_url
    click_on "New aluno"

    fill_in "Bairro", with: @aluno.bairro
    fill_in "Cpf", with: @aluno.cpf
    fill_in "Dta nasc", with: @aluno.dta_nasc
    fill_in "Email", with: @aluno.email
    fill_in "Endereco", with: @aluno.endereco
    check "Esc concluida" if @aluno.esc_concluida
    fill_in "Escolaridade", with: @aluno.escolaridade_id
    fill_in "Logradouro", with: @aluno.logradouro
    fill_in "Municipio", with: @aluno.municipio_id
    fill_in "Nome", with: @aluno.nome
    fill_in "Nome mae", with: @aluno.nome_mae
    fill_in "Nome pai", with: @aluno.nome_pai
    click_on "Create Aluno"

    assert_text "Aluno was successfully created"
    click_on "Back"
  end

  test "should update Aluno" do
    visit aluno_url(@aluno)
    click_on "Edit this aluno", match: :first

    fill_in "Bairro", with: @aluno.bairro
    fill_in "Cpf", with: @aluno.cpf
    fill_in "Dta nasc", with: @aluno.dta_nasc
    fill_in "Email", with: @aluno.email
    fill_in "Endereco", with: @aluno.endereco
    check "Esc concluida" if @aluno.esc_concluida
    fill_in "Escolaridade", with: @aluno.escolaridade_id
    fill_in "Logradouro", with: @aluno.logradouro
    fill_in "Municipio", with: @aluno.municipio_id
    fill_in "Nome", with: @aluno.nome
    fill_in "Nome mae", with: @aluno.nome_mae
    fill_in "Nome pai", with: @aluno.nome_pai
    click_on "Update Aluno"

    assert_text "Aluno was successfully updated"
    click_on "Back"
  end

  test "should destroy Aluno" do
    visit aluno_url(@aluno)
    click_on "Destroy this aluno", match: :first

    assert_text "Aluno was successfully destroyed"
  end
end
