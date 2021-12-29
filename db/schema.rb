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

ActiveRecord::Schema.define(version: 20_211_229_171_331) do
  create_table 'bookings', force: :cascade do |t|
    t.date 'drop_off'
    t.date 'pick_up'
    t.text 'notes'
    t.integer 'customer_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'author_id', null: false
    t.index ['author_id'], name: 'index_bookings_on_author_id'
    t.index ['customer_id'], name: 'index_bookings_on_customer_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'first_name'
    t.string 'phone'
    t.string 'email'
    t.text 'notes'
    t.text 'vet_details'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'last_name'
  end

  create_table 'pets', force: :cascade do |t|
    t.string 'name'
    t.string 'animal'
    t.boolean 'vaccinated', default: false
    t.string 'status'
    t.text 'notes'
    t.integer 'customer_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['customer_id'], name: 'index_pets_on_customer_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'bookings', 'customers'
  add_foreign_key 'bookings', 'users', column: 'author_id'
  add_foreign_key 'pets', 'customers'
end
