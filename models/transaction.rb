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

end