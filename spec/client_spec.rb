require('spec_helper')

describe(Client) do

    it('tells which stylist the client belongs to') do
      stylist = Stylist.create({:name => "stylist"})
      client = Client.create({:name => "client", :stylist_id => stylist.id})
      expect(client.stylist()).to(eq(stylist))
    end
  end
