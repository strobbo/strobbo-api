class StatusesController < ApplicationController
        before_filter :authenticate_user!

  def create
		@status = Status.new
		@status.user = User.find(params[:status][:user_id])
		@status.place = Place.find(params[:status][:place_id])
		@status.text = params[:status][:text]

		if @status.save
			respond_to do |format|
				format.html { redirect_to @status.place }
				format.js
			end
		else
			format.html { redirect_to @places , notice: 'Unprocessable.' }
			format.json { render json: @place.errors, status: :unprocessable_entity }
		end
	end

end
