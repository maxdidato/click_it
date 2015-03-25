class C

  def a
    puts 'hello'
  end

end


module Refine
  refine C do
    def a
      puts 'refinement'
    end

  end
end

using Refine
C.new.a
