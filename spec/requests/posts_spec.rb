require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "He's alive! The Docs alive! He's in the old west but he's alive!!!" do
      user = User.new(
        email: "porthos@test.com",
        password: "password",
        name: "porthos the pirate"
      )
      user.save      
      Post.create!(
        user_id: user.id,
        title: "Test Post",
        body: "A bunch of things about testing.",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSivTWLrm5bXsGhNOHarhq26Ts_jy3V6sYaPw&usqp=CAU"
      )
      get "/posts.json"
      posts = JSON.parse(response.body)
      # p posts      
      expect(posts.length).to eq(1)
      expect(response).to have_http_status(200)
    end
  end
end
