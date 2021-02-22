class Application
    @@items = [Item.new("Milk", 5.99), Item.new("Coffee", 12.99)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Response.new(env)

        if req.path.match(/items/)
            #turn /items/item_name to item_name
            item_name = req.path.split("/items/").last 
            if item = @@item.find{|item| item.name == item_name}
              resp.write item.price
            else
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end
end 

end 