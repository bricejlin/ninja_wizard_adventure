class Weapon
	attr_accessor :name

	def initialize(name)
		@name = name
	end
end

shuriken = Weapon.new('shuriken')
katana = Weapon.new('katana')
nunchaku = Weapon.new('nunchaku')
handclaw = Weapon.new('handclaw')
sai = Weapon.new('sai')
kusari-gama = Weapon.new('kusari-gama')
butterknife = Weapon.new('butterknife')