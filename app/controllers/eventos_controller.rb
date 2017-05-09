class EventosController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@evento = current_user.eventos.build(evento_params)
    if @evento.save
      flash[:success] = "Evento creado de manera exitosa."
      redirect_to root_url
    else
       @feed_items = []
      render 'static_pages/home'
    end
  end

   def destroy
    @evento.destroy
    flash[:success] = "Evento borrado."
    redirect_to request.referrer || root_url
  end

  private

    def evento_params
      params.require(:evento).permit(:nombre_evento, :descripcion, :picture, :categorias, :fechaInic, :fechaFin, :autorizado, :costo, :contacto)
    end
    def correct_user
      @evento = current_user.eventos.find_by(id: params[:id])
      redirect_to root_url if @evento.nil?
    end
end
