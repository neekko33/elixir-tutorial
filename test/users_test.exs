defmodule UsersTest do
  use ExUnit.Case, async: true

  setup_all do
    [name: "Ken", is_cool: true, can_drink: true]
  end

  describe "Users module" do
    test "new/0", %{name: user_name} do
      IO.inspect(user_name)
      default_user = Users.new()
      refute default_user.can_drink
    end

    test "new/2 with the Ken name" do
      ken_user = Users.new("Ken", 30)
      assert ken_user.is_cool
    end
  end
end
