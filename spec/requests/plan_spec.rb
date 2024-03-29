require 'spec_helper'

describe "Leads" do

  before do
    @user   = create :user
    @user2  = create :user, first_name: 'Jim Jones'
    @user3  = create :user, first_name: 'Jim Jones II'
    @organization = create :organization
    @organization.users << @user
    @organization.users << @user2
    login_as @user
  end

end