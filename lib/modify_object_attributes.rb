module ModifyObjectAttributes
    def create(attributes)
        highest_id = all.map(&:id).max.to_i
        # @customers.map { |customer| customer.id }
        new_id = highest_id + 1
        attributes["id"] = new_id
        new_object = new(attributes)
        all << new_object
        new_object
    end

    def update(id, attributes)
        object_to_update = find_by_id(id)
        if object_to_update
            attributes.each do |attribute_name, _|
                if object_to_update.respond_to?("#{attribute_name}=")
                    # checks if the object has a setter method for the current attribute, object can be updated with the given attribute
                object_to_update.send("#{attribute_name}=", _)
                    # calls the method for the attribute
                    # .send allows you to call a method by providing its name as a symbol or a string
                end
            end
        end
        object_to_update
    end

    def delete(id)
        all.reject! do |object|
            object.id.to_i == id.to_i
        end
    end

end