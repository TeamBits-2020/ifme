# frozen_string_literal: true

class ResourcesController < ApplicationController
  skip_before_action :if_not_signed_in

  def new
    @external_resource = ExternalResource.new
  end

  def create
    @external_resource = ExternalResource.new external_resources_params
    if @external_resource.save
      redirect_to new_resource_path,
                  notice: 'Your suggestion has been submitted!'
    else
      redirect_to new_resource_path,
                  alert: @external_resource.errors.full_messages.join(',')
    end
  end

  private

  def external_resources_params
    params.require(:external_resource).permit(:name, :link, languages: [])
  end
end
