class KittensController < ApplicationController

	def index
		@kittens = Kitten.all
	end

	def new
		@kitten = Kitten.new
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			flash[:success] = "Kitten created!"
			redirect_to @kitten
		else
			flash[:error] = "Name cannot be blank!"
			render 'new'
		end
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_params)
			flash[:success] = "Kitten updated!"
			redirect_to @kitten
		else
			flash[:error] = "Name cannot be blank!"
			render 'edit'
		end
	end

	def destroy
		Kitten.find(params[:id]).destroy
		flash[:success] = "Kitten deleted."
		redirect_to kittens_url
	end

	private

		def kitten_params
			params.require(:kitten).permit(:name, :age, :cuteness, :softness)
		end
end
