FactoryBot.define do
  factory :user do
    nickname              { 'テスト' }
    email                 { 'a@gmail.com' }
    password              { 'a00000' }
    password_confirmation { password }
    last_name             { '斎藤' }
    first_name            { 'テスト' }
    last_name_kana        { 'サイトウ' }
    first_name_kana       { 'テスト' }
    birthday              { '2000-01-01' }
  end
end
