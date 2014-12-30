require 'test_helper'

class PetsControllerTest < ActionController::TestCase
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post :create, pet: { dzielnica: @pet.dzielnica, mieszane1: @pet.mieszane1, mieszane2: @pet.mieszane2, mieszane3: @pet.mieszane3, mieszane4: @pet.mieszane4, mieszane5: @pet.mieszane5, mieszane6: @pet.mieszane6, mokre1: @pet.mokre1, mokre2: @pet.mokre2, mokre3: @pet.mokre3, mokre4: @pet.mokre4, mokre5: @pet.mokre5, mokre6: @pet.mokre6, nie_odebrane: @pet.nie_odebrane, nr_domu: @pet.nr_domu, suche1: @pet.suche1, suche2: @pet.suche2, suche3: @pet.suche3, suche4: @pet.suche4, suche5: @pet.suche5, suche6: @pet.suche6, typ: @pet.typ, ulica: @pet.ulica, ulicas: @pet.ulicas }
    end

    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should show pet" do
    get :show, id: @pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet
    assert_response :success
  end

  test "should update pet" do
    patch :update, id: @pet, pet: { dzielnica: @pet.dzielnica, mieszane1: @pet.mieszane1, mieszane2: @pet.mieszane2, mieszane3: @pet.mieszane3, mieszane4: @pet.mieszane4, mieszane5: @pet.mieszane5, mieszane6: @pet.mieszane6, mokre1: @pet.mokre1, mokre2: @pet.mokre2, mokre3: @pet.mokre3, mokre4: @pet.mokre4, mokre5: @pet.mokre5, mokre6: @pet.mokre6, nie_odebrane: @pet.nie_odebrane, nr_domu: @pet.nr_domu, suche1: @pet.suche1, suche2: @pet.suche2, suche3: @pet.suche3, suche4: @pet.suche4, suche5: @pet.suche5, suche6: @pet.suche6, typ: @pet.typ, ulica: @pet.ulica, ulicas: @pet.ulicas }
    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete :destroy, id: @pet
    end

    assert_redirected_to pets_path
  end
end
