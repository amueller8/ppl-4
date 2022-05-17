module UsersHelper
    def get_color(popularity)
        if popularity > 50
            arr = Array.new(3)
            arr[0] = 255
            arr[1] = 0
            arr[2] = 255 - ((popularity-50)*(255/50))
            arr
        else
            arr = Array.new(3)
            arr[0] = ((popularity*(255/50)))
            arr[1] = 0
            arr[2] = 255
            arr
        end
    end
end
