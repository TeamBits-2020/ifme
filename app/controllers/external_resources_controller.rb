# frozen_string_literal: true
class ExternalResourcesController < ApplicationController
  def index
    @resources = ExternalResource.all
  end
end
