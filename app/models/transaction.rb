class Transaction < ActiveRecord::Base

	belongs_to :user
	belongs_to :listing

	result = Braintree::Transaction.sale(
  :amount => "1000.00",
  :payment_method_nonce => nonce_from_the_client,
  :options => {
    :submit_for_settlement => true
  }
)

	if result.success?
	  puts "success!: #{result.transaction.id}"
	elsif result.transaction
	  puts "Error processing transaction:"
	  puts "  code: #{result.transaction.processor_response_code}"
	  puts "  text: #{result.transaction.processor_response_text}"
	else
	  p result.errors
	end
end
