require_relative("../db/sql_runner")

class Transaction
    
    attr_accessor :merchant_id, :category_id, :amount
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @merchant_id = options["merchant_id"].to_i
        @category_id = options["category_id"].to_i
        @amount = options["amount"].to_f
    end

    def save()
        sql = "INSERT INTO transactions
        (
            merchant_id,
            category_id,
            amount
        )
        VALUES
        (
            $1, $2, $3
        )
        RETURNING id"
        values = [@merchant_id, @category_id, @amount]
        result = SqlRunner.run(sql, values)
        @id = result.first()["id"].to_i
    end

    def self.all()
        sql = "SELECT * FROM transactions"
        results = SqlRunner.run(sql)
        return results.map { |transaction| Transaction.new(transaction) }
    end

    def self.find(id)
        sql = "SELECT * FROM transactions
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        return Transaction.new(results.first)
      end

    def merchant()
        sql = "SELECT * FROM merchants
        WHERE id = $1"
        values = [@merchant_id]
        results = SqlRunner.run(sql, values)
        return Merchant.new(results.first)
    end

    def category()
        sql = "SELECT * FROM categories
        WHERE id = $1"
        values = [@category_id]
        results = SqlRunner.run(sql, values)
        return Category.new(results.first)
    end

    def self.total()
        all_transactions = Transaction.all()
        total = 0
        for transaction in all_transactions
          total += transaction.amount
        end
        return total.round(2)
    end

    def update()
        sql = "UPDATE transactions
        SET
        (
          merchant_id,
          category_id,
          amount
        ) =
        (
          $1, $2, $3
        )
        WHERE id = $4"
        values = [@merchant_id, @category_id, @amount, @id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM transactions"
        SqlRunner.run(sql)
    end

    def self.delete(id)
        sql = "DELETE FROM transactions
        WHERE id = $1"
        values = [id]
        SqlRunner.run(sql, values)
    end

end