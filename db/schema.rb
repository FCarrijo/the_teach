# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_11_025533) do
  create_table "agenda_alunos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "aluno_id", null: false
    t.bigint "agenda_professor_id", null: false
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agenda_professor_id"], name: "index_agenda_alunos_on_agenda_professor_id"
    t.index ["aluno_id"], name: "index_agenda_alunos_on_aluno_id"
  end

  create_table "agenda_professores", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "dia"
    t.decimal "professor_id", precision: 10, null: false
    t.bigint "disciplina_id", null: false
    t.string "horario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disciplina_id"], name: "index_agenda_professores_on_disciplina_id"
  end

  create_table "alunos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "email"
    t.date "dta_nasc"
    t.string "nome_mae"
    t.string "nome_pai"
    t.string "logradouro"
    t.string "bairro"
    t.integer "municipio_id"
    t.integer "escolaridade_id"
    t.boolean "esc_concluida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cep"
    t.string "contato"
    t.bigint "user_id"
  end

  create_table "areas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplinas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "escolaridades", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estados", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", comment: "Armazena os estados de um país", force: :cascade do |t|
    t.string "nome", comment: "Identifica o nome do Estado"
    t.string "sigla", limit: 10, comment: "Identifica a sigla do estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pais_id", null: false
    t.index ["pais_id"], name: "index_estados_on_pais_id"
  end

  create_table "interesse_alunos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "aluno_id", null: false
    t.bigint "area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_interesse_alunos_on_aluno_id"
    t.index ["area_id"], name: "index_interesse_alunos_on_area_id"
  end

  create_table "municipios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome", null: false
    t.bigint "estado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_municipios_on_estado_id"
  end

  create_table "paises", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professores", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "agenda_alunos", "agenda_professores"
  add_foreign_key "agenda_alunos", "alunos"
  add_foreign_key "agenda_professores", "disciplinas"
  add_foreign_key "interesse_alunos", "alunos"
  add_foreign_key "interesse_alunos", "areas"
  add_foreign_key "municipios", "estados"
end
