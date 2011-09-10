require "spec_helper"

feature "adding association using checkboxes" do
  before(:all) do
    class User < ActiveRecord::Base
      checkboxes_for :groups
    end
  end

  it "should add the checked association" do
    @user = Factory.create(:user)
    @groups=FactoryGirl.create_list(:group, 2)
    @g1 = @groups.first

    visit edit_user_path(@user)
    check(@g1.to_s)
    click_on('Update User')

    page.should have_content(@g1.to_s)
  end

  it "should remove the unchecked association" do
    @user = Factory.create(:user)
    @g1 =  Factory.create(:group)

    @user.groups << @g1

    visit edit_user_path(@user)
    uncheck(@g1.to_s)

    click_on('Update User')

    page.should have_no_content(@g1.to_s)
  end
end
