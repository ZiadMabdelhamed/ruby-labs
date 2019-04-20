
class ComplexNumber
    
    @real_part
    @img_part

    @@counter_plus = 0
    @@counter_multiply = 0



    def initialize(real,img)
        @real_part = real
        @img_part = img
    end    

    def +(cn)
        @r = cn.get_real() + self.get_real()
        @i = cn.get_img() + self.get_img()
            
        @@counter_plus+=1

        return ComplexNumber.new(@r,@i)        
    end

    def get_real()
        @real_part
    end
      
    def get_img()
        @img_part
    end


    def *(cn)
        @rr = (cn.get_real() * self.get_real())
        @ii = (cn.get_img() * self.get_img())
        @ri = (cn.get_real() * self.get_img())
        @ir = (cn.get_img() * self.get_real())

        @resultR = @rr - @ii
        @resultI = @ri + @ir

        @@counter_multiply+=1
        
        return ComplexNumber.new(@resultR,@resultI)        
    end


    def self.bulk_add(arr)
                    
        @result = arr[0]
        x = 1

        while x < arr.length
            @result = @result+(arr[x])
            x+=1
        end
                      
        return @result  
        
    end


    def self.bulk_multiply(arr)
       
        @result = arr[0]
        x = 1

        while x < arr.length
            @result = @result*(arr[x])
            x+=1
        end
                      
        return @result  
        
    end



    def printresult()
        
        @r = self.get_real()
        @i = self.get_img()
                
        return "#{@r} + #{@i}i"        

    end



    def self.counter_plus
        return puts @@counter_plus
    end

    def self.counter_multiply
        return puts @@counter_multiply
    end
end    

cn1 = ComplexNumber.new(3,2)
cn2 = ComplexNumber.new(1,7)
cn3 = ComplexNumber.new(2,2)

arr = [cn2,cn3]

puts cn1.+(cn2).printresult()

puts cn1.*(cn2).printresult()

puts ComplexNumber.bulk_add(arr).printresult()

puts ComplexNumber.bulk_multiply(arr).printresult()


ComplexNumber.counter_plus()
ComplexNumber.counter_multiply()