class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
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
    @kitten = Kitten.edit(kitten_params)

    if @kitten.update
      flash[:notice] = 'Kitten update ;)'
      redirect_to @kitten
    else
      flash[:alert] = 'Oops, check your fields :/'
      render :new, status: :unprocessable_entity #422
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
