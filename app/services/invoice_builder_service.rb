class InvoiceBuilderService
  attr_accessor :invoice

  def initialize(invoice)
    @invoice = invoice
  end

  # def compute_total

  # end


  # TO DOs
  # - Aggregate all entries for invoice date range
  # - Aggregate all entries as line-items by topic_id
  # - Need to subtotal line-items
  # - Need to compute total for the invoice
end