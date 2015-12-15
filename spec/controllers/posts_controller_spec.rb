require 'rails_helper'

RSpec.describe PostsController, :type => :controller do 
	let(:valid_session) do 
		{ user_id: 1}
	end

	let(:valid_attributes) do
		{
			title: "Title1",
			body: "Body1",
			user_id: "1"
		}
	end

	let(:user) do 
		Post.create! valid_attributes 
	end

	let(:invalid_attributes) do 
		{ title: nil }
	end

	# GETS THE INDEX AND SHOWS ALL THE USERS
	describe "GET index" do
		it "shows a user post list" do
			post = Post.create! valid_attributes
			get :index, {}, valid_session
		end
	end
	# SHOW POST CONTROLLER
	describe "GET Show" do
		it "shows a post" do
			post = Post.create! valid_attributes
			get :show, { id: post.id }
		end
	end

	#NEW INSTANCE OF POST
	describe "GET new" do 
		it "assigns a new instance to @post" do
			get :new, {}, valid_session
			expect(assigns(:post)).to be_instance_of(Post)
		end
	end

	# POST DELETE
	describe "Destroys current user" do 
		it "deletes the requested user" do
			post = Post.create! valid_attributes
			get :destroy, { id: user.id }, valid_session
			expect(response).to redirect_to posts_path
		end
	end
end



