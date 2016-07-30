class CouchesController < ApplicationController
	def create
		host = Host.find(params[:host_id])
		response = {};
		if host.nil? || (host.admin_code != params[:admin_code])
			response[:error] = 'Invalid admin code'
		else
			sanitized_params = params.permit(:description, :comments)
			host.couches.create(sanitized_params)
		end

		respond_to do |format|
			format.json { render json: response.to_json }
		end
	end

	def destroy
	end
end
