# require "rails_helper"
#
#
#
# describe "As a visitor" do
#   describe "when I reach olympian_stats" do
#     it "returns the stats for that game's olympians" do
#       Olympian.destroy_all
#       Team.destroy_all
#       @team = Team.create!(name: "USA")
#       @o1 = @team.olympians.create(name: "Name 1", sex: "F", age: 18, weight: 80, height: 140)
#       @o2 = @team.olympians.create(name: "Name 1", sex: "F", age: 36, weight: 100, height: 150)
#       @o3 = @team.olympians.create(name: "Name 1", sex: "M", age: 20, weight: 100, height: 160)
#       @o4 = @team.olympians.create(name: "Name 1", sex: "M", age: 30, weight: 120, height: 170)
#
#
#       get "/api/v1/olympian_stats"
#       expect(response.status).to eq(200)
#
#       body = JSON.parse(response.body, symbolize_names: true)
#       output = {
#                   "olympian_stats": {
#                     "total_competing_olympians": 4,
#                     "average_weight": {
#                       "unit": "kg",
#                       "male_olympians": 110.0,
#                       "female_olympians": 90.0
#                     },
#                     "average_height": {
#                       "unit": "cm",
#                       "male_olympians": 165.0,
#                       "female_olympians": 145.0
#                     },
#                     "average_age": 26.0
#                   }
#                 }
#
#     end
#   end
# end
