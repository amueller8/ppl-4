module UsersHelper
    def get-color(popularity)
        if popularity > 50
            arr = array.new(3)
            arr[0] = 255
            arr[1] = 0
            arr[2] = 255 - ((popularity-50)*(255/50))
            puts arr
        else
            arr = array.new(3)
            arr[0] = ((popularity*(255/50)))
            arr[1] = 0
            arr[2] = 255
            puts arr
        end
    end
end
