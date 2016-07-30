class HostsController < ApplicationController
	def index
		@hosts = Host.all
	end

	def create
		sanitizedParams = params.permit(:name, :email, :phone, :admin_code)
		Host.create(sanitizedParams)
	end

	def destroy
	end
end
