require 'spec_helper'

describe "User Pages" do
  subject {page}
  
  describe "Edit Page" do
    let(:user) {FactoryGirl.create(:user)}
    before {visit edit_path(user)}

    it {should have_selector('h1', text:'Edit User')}
  end

  describe "Sign up" do
    before {visit signup_path}
    let(:submit) {"Create my account"}

    describe "with invalid info" do
      it "should not create a user" do
        expect {click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Email", with: "yan@wang.com"
        fill_in "Password", with: "foo"
      end
      it "should create a user" do
        expect do
          click_button submit
        end.to change(User, :count).by(1)
      end
    end
  end

  describe "Sign in" do
    before {visit signin_path}
    let(:signin) {"Sing in"}
    
    describe "with valid info" do
      let(:user) {FactoryGirl.create(:user)}
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button sign_in
      end
      it {should have_selector('title', text: user.name)}
      it {should have_link('Profile', href: user_path(user))}
      it {should have_link('Sign out', href: signout_path))}
      it {should_not have_link('Sign in', href: signin_path))}
    end

    describe "with invalid info" do
    end
  end

  describe "pagination" do
    before(:all) {30.times {FactoryGirl.create(:user)}}
    after(:all) {User.delete_all}

    it {should have_selector('div.pagination')}

    it "should list each user" do
      User.paginate(page: 1).each do |user|
        page.should have_selector('li', text: user.name)
      end
    end
  end

  describe "delete links" do
    it {should_not have_link('delete')}

    describe "as admin" do
      let(:admin) {FactoryGirl.admin(:admin)}
      before do
        sign_in admin
        visit users_path
      end

      it {should have_path('delete', href: user_path(User.first))}
      it "should be able to delete another user" do
        expect {click_link('delete').to change(User, :count).by(-1)
      end
    end
  end


  describe "design associations" do
    before {@user.save}
    let!(:older_design) do
      FactoryGirl.create(:design, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_design) do
      FactoryGirl.create(:design, user: @user, created_at: 1.hour.ago)
    end
    it "should have the right design in the right order" do
      @user.design.should == [newer_design, older_design]
    end
    it "should destroy associated designs" do
      designs = @user.designs.dup
      @user.destroy
      designs.should_not be_empty
      designs.each do |design|
        Design.find_by_id(design.id).should be_nil
      end
      lamda do
        Design.find(design.id)
      end.should raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

