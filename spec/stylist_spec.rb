require('spec_helper')

describe(Stylist) do

    it('tells which clients belong to which stylist') do
      stylist = Stylist.create({:name => "Sarah"})
      client1 = Client.create({:name => "client1", :stylist_id => stylist.id})
      client2 = Client.create({:name => "client2", :stylist_id => stylist.id})
      expect(stylist.clients()).to(eq([client1, client2]))
    end
  end
 
