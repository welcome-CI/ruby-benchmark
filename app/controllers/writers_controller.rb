class WritersController < ApplicationController
  before_action :set_writer, only: %i[show edit update destroy]

  def index
    @writers = Writer.all
  end

  def show; end

  def new
    @writer = Writer.new
  end

  def edit; end

  def create
    @writer = Writer.new(writer_params)

    if @writer.save
      redirect_to @writer, notice: 'Writer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @writer.update(writer_params)
      redirect_to @writer, notice: 'Writer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @writer.destroy
    redirect_to writers_url, notice: 'Writer was successfully destroyed.'
  end

  private

  def set_writer
    @writer = Writer.find(params[:id])
  end

  def writer_params
    params.require(:writer).permit(:name)
  end
end
