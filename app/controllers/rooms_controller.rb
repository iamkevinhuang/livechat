class RoomsController < ApplicationController
	before_action :login_required

	def index
		@rooms = Room.order 'name'
		@room = Room.find params[:room_id] if params[:room_id]
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new room_params

		if @room.save
			redirect_to rooms_path(room_id: @room.id), notice: 'Room berhasil dibuat !'
		else
			flash[:alert] = "Room gagal ditambahkan !"
			render :index
		end
	end

	def edit
		@room = Room.find params[:id]
	end

	def update
		@room = Room.find params[:id]

		if @room.update room_params
			redirect_to rooms_path(room_id: @room.id), notice: 'Nama Room berhasil di ubah !'
		else
			flash[:alert] = "Nama Room gagal di ubah !"
			render :index
		end
	end

	def destroy
		@room = Room.find params[:id]
		@room.destroy

		redirect_to rooms_path, notice: 'Room berhasil dihapus !'
	end

	private
		def room_params
			params.require(:room).permit(:name)
		end
end
