require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    #@user = User.new(matricula: "A00397978", password: "RDorame945$")
    @user = User.new(matricula: "A00397978", password: "RDorame945$", password_confirmation: "RDorame945$")
  end

  test "Válido" do
    assert @user.valid?
  end

  test "tiene que haber matrícula" do
    @user.matricula = "     "
    assert_not @user.valid?
  end

  test "Matrícula contiene sólo 9 caracteres" do
    @user.matricula = "A" * 10
    assert_not @user.valid?
  end

  test "Matrícula/Nómina aceptada" do
    usuarios_validos = %w[A00397978 L00397978 a00397978 l00397978]
    usuarios_validos.each do |usuario_valido|
      @user.matricula = usuario_valido
      assert @user.valid?, "#{usuario_valido.inspect} should be valid"
    end
  end

  test "Matrícula/Nómina rechazada" do
    usuarios_no_validos = %w[Aa0039797 ll0039797]
    usuarios_no_validos.each do |usuario_no_valido|
      @user.matricula = usuario_no_valido
      assert_not @user.valid?, "#{usuario_no_valido.inspect} should be invalid"
    end
  end

  test "Matrícula solo puede ser registrada una vez" do
    duplicate_user = @user.dup
    duplicate_user.matricula = @user.matricula.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "Debe haber contraseña (no puede estar en blanco)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "La contraseña debe tener al menos 6 caracteres" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.eventos.create!(nombre_evento: "Hola Mundo", descripcion: "Lorem ipsum")
    assert_difference 'Evento.count', -1 do
      @user.destroy
    end
  end

end