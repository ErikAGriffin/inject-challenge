class Array

  # Adapted frm Gabe's solution

  def inject_me(initial= :no_initial_given, symbol= :no_symbol_given)

    if !/[0-9]/.match(initial.to_s) && initial != :no_initial_given
      return self.inject_me {|x,y| x.send(initial,y)}
    end


    if symbol != :no_symbol_given
      return self.inject_me(initial) {|x,y| x.send(symbol,y)}
    end

    if initial != :no_initial_given
      self.unshift(initial)
    end

    memo = self[0]
    self.each_with_index do |item, index|
      if index == 0
        next
      end
      memo = yield memo, item
    end
    memo
  end

end
