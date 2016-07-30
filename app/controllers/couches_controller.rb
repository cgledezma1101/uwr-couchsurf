class CouchesController < ApplicationController
	def create
		host = Host.find(params[:host_id])
		response = {};
		if host.nil? || (host.admin_code != params[:admin_code])
			response[:error] = 'InvalidCode'
		else
			sanitized_params = params.permit(:description, :host_comments)
			host.couches.create(sanitized_params)
			response[:success] = true
		end

		respond_to do |format|
			format.json { render json: response.to_json }
		end
	end

	def occupy
		couch = Couch.find(params[:id])
		sanitized_params = params.permit(:occupant_name, :occupant_phone, :occupant_email, :occupant_comments)
		couch.update(sanitized_params)

		respond_to do |format|
			format.json { render json: { success: true }.to_json }
		end
	end

	def vacate
		couch = Couch.find(params[:id])
		response = {}
		if couch.host.admin_code != params[:admin_code]
			response[:error] = 'InvalidCode'
		else
			couch.update(occupant_name: nil, occupant_email: nil, occupant_phone: nil, occupant_comments: nil)
			response[:success] = true
		end

		respond_to do |format|
			format.json { render json: response.to_json }
		end
	end

	def destroy
		couch = Couch.find(params[:id])
		response = {}
		if couch.host.admin_code != params[:admin_code]
			response[:error] = 'InvalidCode'
		else
			couch.destroy
			response[:success] = true
		end

		respond_to do |format|
			format.json { render json: response.to_json }
		end
	end

	def update_details
		couch = Couch.find(params[:id])
		response = {}
		if couch.host.admin_code != params[:admin_code]
			response[:error] = 'InvalidCode'
		else
			sanitized_params = params.permit(:description, :host_comments)
			couch.update(sanitized_params)
			response[:success] = true
		end

		respond_to do |format|
			format.json { render json: response.to_json }
		end
	end
end
