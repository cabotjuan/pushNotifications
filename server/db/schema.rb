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

ActiveRecord::Schema[7.0].define(version:
   20_230_120_174_057) do
  create_table 'devices', force: :cascade do |t|
    t.string 'token'
    t.string 'device_type'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_devices_on_user_id'
  end

  create_table 'rpush_apps', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'environment'
    t.text 'certificate'
    t.string 'password'
    t.integer 'connections', default: 1, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'type', null: false
    t.string 'auth_key'
    t.string 'client_id'
    t.string 'client_secret'
    t.string 'access_token'
    t.datetime 'access_token_expiration'
    t.text 'apn_key'
    t.string 'apn_key_id'
    t.string 'team_id'
    t.string 'bundle_id'
    t.boolean 'feedback_enabled', default: true
  end

  create_table 'rpush_feedback', force: :cascade do |t|
    t.string 'device_token', limit: 64
    t.datetime 'failed_at', precision: nil, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'app_id'
    t.index ['device_token'], name: 'index_rpush_feedback_on_device_token'
  end

  create_table 'rpush_notifications',
               force: :cascade do |t|
    t.integer 'badge'
    t.string 'device_token', limit: 64
    t.string 'sound'
    t.text 'alert'
    t.text 'data'
    t.integer 'expiry', default: 86_400
    t.boolean 'delivered', default: false, null: false
    t.datetime 'delivered_at', precision: nil
    t.boolean 'failed', default: false, null: false
    t.datetime 'failed_at', precision: nil
    t.integer 'error_code'
    t.text 'error_description'
    t.datetime 'deliver_after', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'alert_is_json', default: false, null: false
    t.string 'type', null: false
    t.string 'collapse_key'
    t.boolean 'delay_while_idle', default: false, null: false
    t.text 'registration_ids'
    t.integer 'app_id', null: false
    t.integer 'retries', default: 0
    t.string 'uri'
    t.datetime 'fail_after', precision: nil
    t.boolean 'processing', default: false, null: false
    t.integer 'priority'
    t.text 'url_args'
    t.string 'category'
    t.boolean 'content_available', default: false, null: false
    t.text 'notification'
    t.boolean 'mutable_content', default: false, null: false
    t.string 'external_device_id'
    t.string 'thread_id'
    t.boolean 'dry_run', default: false, null: false
    t.boolean 'sound_is_json', default: false
    t.index %w[delivered failed processing deliver_after created_at],
            name: 'index_rpush_notifications_multi', where: 'NOT delivered AND NOT failed'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'devices', 'users'
end
