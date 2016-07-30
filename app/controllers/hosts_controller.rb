class HostsController < ApplicationController
	def index
		@hosts = Host.all
	end

	def create
		sanitized_params = params.permit(:name, :email, :phone, :admin_code)
		Host.create(sanitized_params)
	end

	def destroy
	end
end
