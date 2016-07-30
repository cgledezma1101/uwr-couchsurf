class HostsController < ApplicationController
	def index
		@hosts = Host.all
	end

	def create
	end

	def destroy
	end
end
