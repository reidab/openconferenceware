# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150406221528) do

  create_table "open_conference_ware_authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_conference_ware_comments", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "open_conference_ware_comments", ["proposal_id"], name: "index_open_conference_ware_comments_on_proposal_id"

  create_table "open_conference_ware_events", force: true do |t|
    t.string   "title"
    t.datetime "deadline"
    t.text     "open_text"
    t.text     "closed_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "proposal_status_published",               default: false, null: false
    t.text     "session_text"
    t.text     "tracks_text"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "accept_proposal_comments_after_deadline", default: false
    t.string   "slug"
    t.boolean  "schedule_published",                      default: false
    t.integer  "parent_id"
    t.boolean  "proposal_titles_locked",                  default: false
    t.boolean  "accept_selector_votes",                   default: false
    t.boolean  "show_proposal_confirmation_controls",     default: false
  end

  add_index "open_conference_ware_events", ["slug"], name: "index_open_conference_ware_events_on_slug"

  create_table "open_conference_ware_proposals", force: true do |t|
    t.integer  "user_id"
    t.string   "presenter"
    t.string   "affiliation"
    t.string   "email"
    t.string   "website"
    t.text     "biography"
    t.string   "title"
    t.text     "description"
    t.boolean  "agreement",           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.datetime "submitted_at"
    t.text     "note_to_organizers"
    t.text     "excerpt"
    t.integer  "track_id"
    t.integer  "session_type_id"
    t.string   "status",              default: "proposed", null: false
    t.integer  "room_id"
    t.datetime "start_time"
    t.string   "audio_url"
    t.text     "speaking_experience"
    t.string   "audience_level"
    t.datetime "notified_at"
  end

  add_index "open_conference_ware_proposals", ["event_id"], name: "index_open_conference_ware_proposals_on_event_id"
  add_index "open_conference_ware_proposals", ["room_id"], name: "index_open_conference_ware_proposals_on_room_id"
  add_index "open_conference_ware_proposals", ["submitted_at"], name: "index_open_conference_ware_proposals_on_submitted_at"
  add_index "open_conference_ware_proposals", ["track_id"], name: "index_open_conference_ware_proposals_on_track_id"
  add_index "open_conference_ware_proposals", ["user_id"], name: "index_open_conference_ware_proposals_on_user_id"

  create_table "open_conference_ware_proposals_users", id: false, force: true do |t|
    t.integer "proposal_id"
    t.integer "user_id"
  end

  add_index "open_conference_ware_proposals_users", ["proposal_id"], name: "index_open_conference_ware_proposals_users_on_proposal_id"
  add_index "open_conference_ware_proposals_users", ["user_id"], name: "index_open_conference_ware_proposals_users_on_user_id"

  create_table "open_conference_ware_rooms", force: true do |t|
    t.string   "name",                  null: false
    t.integer  "capacity"
    t.string   "size"
    t.string   "seating_configuration"
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "open_conference_ware_rooms", ["event_id"], name: "index_open_conference_ware_rooms_on_event_id"

  create_table "open_conference_ware_schedule_items", force: true do |t|
    t.string   "title"
    t.text     "excerpt"
    t.text     "description"
    t.datetime "start_time"
    t.integer  "duration"
    t.integer  "event_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "open_conference_ware_schedule_items", ["event_id"], name: "index_open_conference_ware_schedule_items_on_event_id"
  add_index "open_conference_ware_schedule_items", ["room_id"], name: "index_open_conference_ware_schedule_items_on_room_id"

  create_table "open_conference_ware_selector_votes", force: true do |t|
    t.integer "user_id",     null: false
    t.integer "proposal_id", null: false
    t.integer "rating",      null: false
    t.text    "comment"
    t.integer "event_id"
  end

  add_index "open_conference_ware_selector_votes", ["event_id"], name: "index_open_conference_ware_selector_votes_on_event_id"

  create_table "open_conference_ware_session_types", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "duration"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "open_conference_ware_session_types", ["event_id"], name: "index_open_conference_ware_session_types_on_event_id"

  create_table "open_conference_ware_snippets", force: true do |t|
    t.string   "slug",                       null: false
    t.text     "description",                null: false
    t.text     "content"
    t.integer  "value"
    t.boolean  "public",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "open_conference_ware_snippets", ["slug"], name: "index_open_conference_ware_snippets_on_slug", unique: true

  create_table "open_conference_ware_taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "open_conference_ware_taggings", ["tag_id"], name: "index_open_conference_ware_taggings_on_tag_id"
  add_index "open_conference_ware_taggings", ["taggable_id", "taggable_type", "context"], name: "index_ocw_taggings_on_id_type_and_context"

  create_table "open_conference_ware_tags", force: true do |t|
    t.string "name"
  end

  create_table "open_conference_ware_tracks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "color"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "excerpt"
  end

  add_index "open_conference_ware_tracks", ["event_id"], name: "index_open_conference_ware_tracks_on_event_id"

  create_table "open_conference_ware_user_favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_conference_ware_users", force: true do |t|
    t.string   "email"
    t.string   "salt",               limit: 40
    t.boolean  "admin",                           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "affiliation",        limit: 128
    t.text     "biography"
    t.string   "website",            limit: 1024
    t.boolean  "complete_profile"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "blog_url"
    t.string   "identica"
    t.string   "twitter"
    t.boolean  "selector",                        default: false
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

end
