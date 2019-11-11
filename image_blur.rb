class Image
  # defining an array of arrays like the grid stored in <image>
  def initialize(pixels)
    @image = pixels 
  end
  # displays the image by joining the chars in the row and putting them out
  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur!
    known_ones = [];
    @image.each_with_index do |row, i|      
      row.each_with_index do |r, r_i|
        known_ones << [i, r_i] if r == 1    # storing our known ones in an empty array
      end
    end

    known_ones.each do |c|                  # using known ones change zeroes around them
      @image[c[0] - 1][c[1]] = 1 unless c[0] - 1 <= 0                   #above case
      @image[c[0] + 1][c[1]] = 1 unless c[0] + 1 >= @image.length - 1   #below case
      @image[c[0]][c[1] - 1] = 1 unless c[1] - 1 <= 0                   #left case
      @image[c[0]][c[1] + 1] = 1 unless c[1] + 1 >= @image[c[0]].length #right case
    end
  end
end

image = Image.new([
  [1, 0, 0, 0, 0],
  [0, 1, 0, 0, 0],
  [0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0],
  [1, 0, 0, 1, 0]
])
image.output_image
puts "~~~~~"
image.blur!
image.output_image
