class CouchesController < ApplicationController
	def create
		host = Host.find(params[:host_id])
		response = {};
		if host.nil? || (host.admin_code != params[:admin_code])
			response[:error] = 'InvalidCode'
		else
			sanitized_params = params.permit(:description, :comments)
			host.couches.create(sanitized_params)
		end

		respond_to do |format|
			format.json { render json: response.to_json }
		end
	end

	def update
		couch = Couch.find(params[:id])
		sanitized_params = params.permit(:occupant_name, :occupant_phone, :occupant_email, :occupant_comments)
		couch.update(sanitized_params)

		respond_to do |format|
			format.json { render json: { success: true }.to_json }
		end
	end

	def destroy
	end
end
