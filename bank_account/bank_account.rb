require "logger"

class BankAccount
  attr_accessor :name
  attr_reader :logger, :transactions

  def initialize(name, account)
    @name = name
    @account = account
    @transactions = []
    @logger = Logger.new("account.txt")
  end

  def balance(pin_number)
    if pin_number == pin
      logger.info "[#{name}] Balance is #{@account}"
    else
      pin_error
    end
  end

  def deposit(pin_number, amount)
    if pin_number == pin
      logger.info "[#{name}] Deposited #{amount}"
      transactions.push(amount)
      @account += amount
    else
      pin_error
    end
  end

  def withdraw(pin_number, amount)
    if pin_number == pin
      if @account >= amount
        logger.info "[#{name}] Withdrew #{amount}"
        transactions.push(-amount)
        @account -= amount
      else
        logger.error "Not enough money on your balance"
      end
    else
      pin_error
    end
  end

  private

  def pin
    @pin = 9030
  end

  def pin_error
    logger.error "Wrong pin-code"
  end
end

account = BankAccount.new("Vinya", 1_000_000)
account.balance(9030)
account.deposit(9030, 100_000)
account.balance(9030)
account.withdraw(9030, 50_000)
account.balance(9030)
