require "calculette/version"
require "colorize"
module Calculette

  # This is where our great Calculator is born
  class Calculator

    # INIT: initialize our program
    def init()
      puts "enter a number"
      number = endApp?(gets.chomp)
      puts "give me an operator: [+]  [-]  [*]  [/]  [%]  [cos]  [sin]  [tan]  [exp]"
      operator = endApp?(gets.chomp)
      verify(operator, number.to_i)
      puts "enter a second number"
      number2 = endApp?(gets.chomp)
      calcul(number.to_i, operator, number2.to_i)
    end


    # CALCUL : this method will calcul results depending of the operator
    def calcul(num1, operator, num2 = nil)
      result = 0
      case operator
      when "+" then result = num1 + num2, "\n"
      when "-" then result = num1 - num2, "\n"
      when "*" then result = num1 * num2, "\n"
      when "/" then
        if num2 != 0 then result = num1 / num2, "\n"
        else
          puts "DON'T JOKE WITH THE GREAT CALCULATOR".red
          exit
        end
      when "%" then
        if num2 != 0 then result = num1 % num2, "\n"
        else
          puts "DON'T JOKE WITH THE GREAT CALCULATOR".red
          exit
        end
      when "cos" then
        result = Math.cos(num1), "\n"
      when "tan" then
        result = Math.tan(num1), "\n"
      when "exp" then
        result = Math.exp(num1), "\n"
      when "sin" then
        result = Math.sin(num1), "\n"
      else
        print "Mauvais opérateur\n".red
      end
      print "the result is: #{result[0]} !\n".green
      init()
    end

    def verify(operator, number)
      if (operator.length > 1) then calcul(number, operator)
      else return operator
      end
    end

    #ENDAPP: if the user type 'end' or 'help' this method will display or close the program
    def endApp?(get)
      case get
      when "end" then
          puts "this is the end".red
          exit
      when "help" then
          puts "YOU DON'T NEED HELP, try 'end' if you want to leave.".yellow
          init()
      when "reset" then
          puts "lets start again!".green
          init()
      else
        number = get
      end

    end
  end
end
