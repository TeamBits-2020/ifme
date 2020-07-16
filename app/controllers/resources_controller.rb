# frozen_string_literal: true
class ResourcesController < ApplicationController
  skip_before_action :if_not_signed_in

  def new
    @external_resource = ExternalResource.new
  end
end
