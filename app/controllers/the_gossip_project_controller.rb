class TheGossipProjectController < ApplicationController
  skip_before_action :only_signed_in

  def team 
  end

  def contact 
  end

  def welcome
  end

end
