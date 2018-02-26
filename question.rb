class Question 
  attr_reader :num1, :num2, :syms

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @syms = [:+, :-, :*].sample
  end

  def question_output
    print "#{num1} #{syms} #{num2} ?"
    res = gets.chomp
    check_response(res)
  end

  private

  def check_response(res)
    response = num1.public_send syms, num2

    if(res.to_i == response.to_i)
      return [true]
    end
    return [false, response]
  end

end