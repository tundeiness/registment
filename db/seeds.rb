# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

new_condition = EquipmentCondition.create(condition: "new", count: 0)
intact_condition = EquipmentCondition.create(condition: "need repair", count: 0)
repair_condition = EquipmentCondition.create(condition: "damaged", count: 0)
damaged_condition = EquipmentCondition.create(condition: "intact", count: 0)
