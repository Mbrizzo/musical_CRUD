class ArtistsController < ApplicationController
 
 
  def index
  
    @artist = Artist.all
  
    end

    def new

      @artist = Artist.new

  end

  def show

    @artist = Artist.find(params[:id])

  end 

  def edit

    @Artist = Artist.find(params[:id])

  end

  def update
      
      @artist = artist.find(params[:id])

        if @artist.update_attributes(artist_params)
          redirect_to @artist, :notice => 'Cadastro Atualizado com Sucesso!'
      
        else
          render :update
        end

      end

      def create

        @artist = Artist.new(artist_params)
        if @artist.save
          redirect_to @artist, :notice => 'Cadastro criado com sucesso!'
          else
            render :new
          end
       
        end


        def destroy
    
          id = params[:id]
          Artist.destroy id
          redirect_to :artist
        end
        
      end


          private

            def artist_params

                params.require(:artist).permit(:name)
              
              end


