tableextension 50108 McdSalesShipmentHeader extends "Sales Shipment Header"
{
    fields
    {
        field(50101; McdShippingNote; text[50])
        {
            Caption = 'Shipping Note';
            DataClassification = CustomerContent;
        }
        field(50102; McdOuterSalespersonCode; Code[20])
        {
            Caption = 'Outer Salesperson Code';
            TableRelation = "Salesperson/Purchaser" where(Blocked=const(false));
        }
    }
}
