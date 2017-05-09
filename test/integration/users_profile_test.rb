require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.matricula)
    assert_select 'h1', text: @user.matricula
    assert_select 'h1>img.gravatar'
    assert_match @user.eventos.count.to_s, response.body
    assert_select 'div.pagination'
    @user.eventos.paginate(page: 1).each do |evento|
      assert_match evento.nombre_evento, evento.descripcion, response.body
    end
  end
end
