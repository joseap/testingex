require 'rails_helper'

RSpec.describe UsersController, :type => :controller do 
	let(:valid_session) do 
		{ user_id: 1}
	end

	let(:valid_attributes) do
		{
			fname: "user",
			lname: "one", 
			username: "userone",
			email: "user@email.com",
			password: "testing123",
			country: "Colombia"
		}
	end

	let(:user) do 
		User.create! valid_attributes 
	end

	let(:invalid_attributes) do 
		{ fname: nil }
	end

	# GETS THE INDEX AND SHOWS ALL THE USERS
	describe "GET index" do
		it "shows a user index list" do
			user = User.create! valid_attributes
			get :index, {}, valid_session
			expect(assigns(:user)).to eq([user])
		end
	end

	# SHOWS A SPECIFIC USER.
	describe "GET show" do 
		it "Assigns the requested user to @user" do
			user = User.create! valid_attributes
			get :show, { id: user.id }, valid_session
			expect(assigns(:user)).to eq(user)
		end
	end

	#NEW INSTANCE OF USER
	describe "GET new" do 
		it "assigns a new instance to @user" do
			get :new, {}, valid_session
			expect(assigns(:user)).to be_instance_of(User)
		end
	end

	#WORKS EXACTLY AS 'SHOW'
	describe "GET edit" do 
		it "Edit a specific user" do
			user = User.create! valid_attributes
			get :edit, { id: user.id }, valid_session
			expect(assigns(:user)).to eq(user)
		end
	end

	#UPDATE THE USER
	describe "PUT/PATCH update" do
		context "When valid attributes" do
			it "updates the user" do
				user = User.create! valid_attributes
				fname = "UsuarioNo.1"
				patch :update, { id: user.id, user: { fname: fname } }, valid_session
				expect(User.find_by_email(user.email).fname).to eq(fname)
		end

	it "assigns the requested user to @user" do 
		user = User.create! valid_attributes
		fname = "UsuarioNo.1"
		patch :update, { id: user.id, user: { fname: fname } }, valid_session
		expect(response).to redirect_to assigns(:user)
		end

	it "redirects to a specific user" do 
				user = User.create! valid_attributes
				fname = "Usuario No.1"
				patch :update, { id: user.id, user: { fname: fname } }, valid_session
				expect(response).to redirect_to assigns(:user)
			end 
		end

		context "when invalid attributes" do
			it "does not update the user" do
				user = User.create! valid_attributes
				patch :update, { id: user.id, user: { fname: nil } }, valid_session
				expect(User.find_by_email(user.email).fname).to be_present
			end

			it "renders the edit template" do
				user = User.create! valid_attributes
				patch :edit, { id: user.id, user: { fname: nil } }, valid_session
				expect(response).to render_template(:edit)
			end
		end
	end

	describe "Destroys current user" do 
		it "deletes the requested user" do
			user = User.create! valid_attributes
			get :destroy, { id: user.id }, valid_session
			expect(response).to redirect_to root_path
		end
	end
end