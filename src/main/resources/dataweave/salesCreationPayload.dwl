%dw 2.0
output application/json
var sales = vars.requestPayload default {}
---
{
    transactionId: sales.salesId,
    source: Mule::p("source"),
    customerName: sales.fullName,
    deliveryAddress: sales.deliveryLoc,
    customerContact: sales.contact,
    customerAge: sales.age as Number,
    customerGender: sales.gender default null,
    items: sales.products map {
		itemId: $.id,
		name: $.name,
		price: $.price,
		quantity: $.qty
	},
    totalAmount: sales.amountDue,
    paymentType: sales.paymentType,
    transactionDate: sales.creationDate as DateTime
}