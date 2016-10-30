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
    @unpais = 10 # Predeterminamos, Argentina
    @unaprovincia = 108 # Predeterminamos, Mendoza
  end

  # GET /users/1/edit
  def edit
    binding.pry
    @unpais = @user.province.country.id

    # Buscamos los telefonos anteriores de este usuario
    @tel_fijo = @user.phones.find_by(type_id: 1).telefono
    @tel_celu = @user.phones.find_by(type_id: 2).telefono
    @tel_labo = @user.phones.find_by(type_id: 3).telefono
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if params[:pais_elegido] != params[:unpais]  #Cambió el option por defecto, que era 10
      # Esto significa que no vamos a guardar los datos todavía.
      # En su lugar vamos a crear el formulario de vuelta, con valores distintos en los selects

      # Este es un truco sucio para provocar que el formulario falle y se vuelva a crear
      @user.province_id = nil

      # Persistimos el nuevo pais escogido
      @unpais = params[:pais_elegido].to_i

      # Persistimos los telefonos enviados, para que no se pierdan.
      # A diferencia de los campos propios del user (por ejemplo
      # <%= f.text_field :nombre %>, recuerden que los controles
      # text_field de los telefonos no esta creados con el objeto f
      # perteneciente al <%= form_for user ... do |f|  %>
      # Sino bajo text_field_tag independientes
      @tel_fijo = params[:tel_fijo]
      @tel_celu = params[:tel_celular]
      @tel_labo = params[:tel_laboral]
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

        binding.pry

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
