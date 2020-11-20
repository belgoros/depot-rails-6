class Order < ApplicationRecord
  enum pay_type: {
    "Check"         => 0,
    "Credit card"   => 1,
    "Purchase oder" => 1
  }
end
