class AlbumsController < ApplicationController
 
 
  def index
  
    @album = Album.name_album(params['title'])
                  .name_artist(params['artist_id'])
  
    end
    
    def new

      @album = Album.new(artist_id: params[:artist_id])

     end


        def show

          @album = Album.find(params[:id])

        end  

        def edit

          @album = Album.find(params[:id])

        end  


        def create

          @album = Album.new(album_params)
          if @album.save
            redirect_to @album.artist, :notice => 'Cadastro criado com sucesso!'
            else
              render :new
            end

          end 

          def update

            @album = Album.find(params[:id])
               if @album.update(album_params)
                redirect_to @album, :notice => 'Cadastro Atualizado com Sucesso!'
                else
                  render :update
                end
              end

          
          
          private

              def album_params

                  params.require(:album).permit(:title, :artist_id)
                
                end


              end
          
