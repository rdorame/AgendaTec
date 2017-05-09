require 'test_helper'

class EventosControllerTest < ActionController::TestCase

  def setup
    @evento = eventos(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Evento.count' do
      post :create, evento: { content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Evento.count' do
      delete :destroy, id: @evento
    end
    assert_redirected_to login_url
  end
end
