# frozen_string_literal: true
class ResourcesController < ApplicationController
  skip_before_action :if_not_signed_in

  def new
    @external_resource = ExternalResource.new
  end

  def create
    attributes = { name: external_resources_params[:name],
                   link: external_resources_params[:link],
                   languages: [external_resources_params[:languages]]
    }
    @external_resource = ExternalResource.create! attributes
    if @external_resource.save
      redirect_to pages_home_path
    else
      redirect_to resources_path
    end
  end

  private

  def external_resources_params
    params.require(:external_resource).permit(:name, :link, :languages)
  end
end
