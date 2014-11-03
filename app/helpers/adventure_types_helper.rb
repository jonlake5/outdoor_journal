module AdventureTypesHelper
  def adventureTypesByUser(user)
    #@user = User.find(user.id)
    adventure_types = AdventureType.where(user_id: user.id).order('adventure_type asc').to_a
    adventure_types
  end
end
