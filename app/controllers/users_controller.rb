class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @unpais = 10
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @unpais = 10
  end
  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    binding.pry
    @user = User.new(user_params)
    if params[:pais_elegido] != params[:unpais]  #Cambió el option por defecto, que era 10
      # Esto es para provocar que el formulario falle y se vuelva a crear
      @user.province_id = nil

      #Persistimos el nuevo pais escogido
      @unpais = params[:pais_elegido].to_i
    else
      @user.province_id = params[:user][:province_id].to_i
    end

    respond_to do |format|
      if @user.save
        if params[:tel_fijo] != nil
          fijo = Phone.new
          fijo.telefono = params[:tel_fijo]
          fijo.type_id = 1
          fijo.user_id = @user.id
          fijo.save
        end

        # Lo mismo, mas corto
        if params[:tel_celular] != nil
          Phone.create(telefono: params[:tel_celular], type_id: 2, user_id: @user.id)
        end

        # Mas corto!
        Phone.create(telefono: params[:tel_laboral], type_id: 3, user_id: @user.id) if params[:tel_laboral]

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end # fin respond_to do |format|
  end # fin def create

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if params[:user][:country_id]
      @unpais = params[:user][:country_id].to_i
    end
    @user = User.new(user_params)

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nombre, :apellido, :email, :activo, :edad, :detalles, :province_id)
    end
end
