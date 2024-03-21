pageextension 50113 McdSalesReturnOrder extends "Sales Return Order"
{
    layout
    {
        addafter("Shipping Agent Service Code")
        {
            field(McdShippingNote; Rec.McdShippingNote)
            {
                ApplicationArea = All;
            }
        }
        addafter("Salesperson Code")
        {
            field(McdInnerSalespersonCode; Rec.McdOuterSalespersonCode)
            {
                ApplicationArea = All;
            }
        }
        modify("Salesperson Code")
        {
            Caption = 'Inner Salesperson Code';
        }
    }
}
