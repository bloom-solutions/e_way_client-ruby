module EWayClient
  class Province

    DISTRICT_KEY_FORMAT = /districts\d/
    TIME_KEY_FORMAT = /time\d/
    TYPES = %i[districts time]
    TYPES_COUNT = 5

    include Virtus.model
    attribute :data, Hash
    attribute :province_id, Integer, lazy: true, default: :default_province_id
    attribute(:province_name_eng, String, {
      lazy: true,
      default: :default_province_name_eng,
    })
    attribute(:province_name_viet, String, {
      lazy: true,
      default: :default_province_name_viet,
    })
    attribute(:response_code, String, {
      lazy: true,
      default: :default_response_code,
    })
    attribute :districts, Array[String], lazy: true, default: :default_districts
    TYPES_COUNT.times do |n|
      count = n+1
      attribute(:"districts#{count}", String, {
        lazy: true,
        default: :"default_districts#{count}",
      })

      attribute(:"time#{count}", String, {
        lazy: true,
        default: :"default_time#{count}",
      })
    end

    private

    def default_province_id
      data[:province_id]
    end

    def default_response_code
      data[:response_code]
    end

    def default_province_name_eng
      data[:province_name_eng]
    end

    def default_province_name_viet
      data[:province_name_viet]
    end

    def default_districts
      (1..TYPES_COUNT).each_with_object([]) do |n, array|
        array.concat(self.send("districts#{n}"))
      end
    end

    TYPES_COUNT.times do |n|
      count = n+1
      define_method "default_districts#{count}" do
        districts_str = data[:"districts#{count}"]
        if districts_str.blank?
          []
        else
          districts_str.split(",").map do |district_name|
            district_name.strip.gsub(/\.$/, "")
          end
        end
      end

      define_method "default_time#{count}" do
        data[:"time#{count}"]
      end
    end

  end
end
