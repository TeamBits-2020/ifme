class ExternalResourcesController < ApplicationController
    def index
        @resources = ExternalResource.all
    end
end
