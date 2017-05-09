require 'test_helper'

class EventoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @evento = @user.eventos.build(nombre_evento: "Colecta1", descripcion: "Lorem ipsum")
  end

  test "should be valid" do
    assert @evento.valid?
  end

  test "user id should be present" do
    @evento.user_id = nil
    assert_not @evento.valid?
  end

  test "nombre should be present" do
    @evento.nombre_evento = "   "
    assert_not @evento.valid?
  end

  test "descripcion should be present" do
    @evento.descripcion = "   "
    assert_not @evento.valid?
  end

  test "nombre should be at most 50 characters" do
    @evento.nombre_evento = "a" * 51
    assert_not @evento.valid?
  end

  test "content should be at most 140 characters" do
    @evento.descripcion = "a" * 141
    assert_not @evento.valid?
  end

  test "order should be most recent first" do
    assert_equal eventos(:most_recent), Evento.first
  end
end
