class Tools::ToolsController < ApplicationController
  acts_as_token_authentication_handler_for User, only: [:date]
  before_action :authenticate_user!, :except => [:date]

  def index
  end
end
