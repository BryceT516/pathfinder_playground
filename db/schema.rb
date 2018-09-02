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

ActiveRecord::Schema.define(version: 2018_08_31_062714) do

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "algorithm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "executions", force: :cascade do |t|
    t.integer "map_id"
    t.integer "agent_id"
    t.integer "agent_current_x"
    t.integer "agent_current_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_executions_on_agent_id"
    t.index ["map_id"], name: "index_executions_on_map_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "description"
    t.integer "width"
    t.integer "height"
    t.integer "start_point_x"
    t.integer "start_point_y"
    t.integer "end_point_x"
    t.integer "end_point_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "polygons", force: :cascade do |t|
    t.string "designation"
    t.integer "vertex_count"
    t.integer "map_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_polygons_on_map_id"
  end

  create_table "vertices", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.integer "polygon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["polygon_id"], name: "index_vertices_on_polygon_id"
  end

end
