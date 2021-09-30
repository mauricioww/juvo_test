module Api::V1::CountriesHelper
  def standard_output(json)
    info_list = information(json.flatten)
    keys = get_keys(info_list.first)
    translate_json(info_list, keys)
  end

  def information(plain_json)
    if plain_json.first.kind_of?(String)
      plain_json = information(plain_json.last.flatten)
    end
    plain_json
  end

  def get_keys(object)
    keys = {}
    object.each do |k, v|
      if k.downcase.include?('name')
        keys[:name] = k
      elsif v.start_with?('http')
        keys[:icon] = k
      else
        keys[:id] = k
      end
    end
    keys
  end

  def translate_json(objects, keys)
    {
      "companies": 
        objects.inject([]) do |information, objt|
          information.append({
            "id": objt[keys[:id]],
            "name": objt[keys[:name]],
            "icon": objt[keys[:icon]]
          })
        end
    }
  end
end