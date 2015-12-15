require 'rails_helper'

RSpec.describe Post, type: :model do
	 let(:valid_session) do 
	 	{ user_id: 1}
	 end

	  let(:valid_attributes) do
		{
			title: "Title1",
			body: "Body1",
			user_id: "1"
		}

		let(:invalid_attributes) do 
			{ title: nil }
		end

		describe "is invalid without a" do
			let(:post){ Post.new(valid_attributes) }

			it "title" do 
				post.title = nil
				expect(:post).to be_invalid
			end
		end


		describe "Post has a user id" do
			let(:post){ Post.user_id }

			it "no_id" do
				post.user_id = nil
				expect(:post).to be_invalid
			end
		end

		describe "Post has a body" do
			let(:post){ Post.new(valid_attributes) }

			it "empty body" do
				post.body = nil
				expect(:post).to be_invalid
			end
		end
	end
end

	


