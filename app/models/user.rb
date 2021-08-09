class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :user_name, uniqueness: true, presence: true
  validates :role, presence: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  enum role: {user: 0, admin_user: 1}
end
