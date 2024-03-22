class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:notice] = 'Kitten created ;)'
      redirect_to @kitten
    else
      flash[:alert] = 'Oops, check your fields :/'
      render :new, status: :unprocessable_entity #422
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:notice] = 'Kitten update ;)'
      redirect_to @kitten
    else
      flash[:alert] = 'Oops, check your fields :/'
      render :new, status: :unprocessable_entity #422
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.destroy
      flash[:notice] = "#{@kitten.name} deleted ;)"
      redirect_to :root
    else
      flash[:alert] = 'Problem when deleting kitten'
      render @kitten, status: 422
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
